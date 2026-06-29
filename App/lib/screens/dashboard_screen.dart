import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isConnected = false;
  bool _missionRunning = false;
  double _batteryLevel = 78.0;
  double _soilMoisture = 42.0;
  String _gpsLocation = '3.8480° N, 11.5021° E';
  String _missionStatus = 'Idle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text(
          'AGRO-NOVA Control',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(
                  _isConnected ? Icons.wifi : Icons.wifi_off,
                  color: _isConnected ? Colors.greenAccent : Colors.redAccent,
                ),
                const SizedBox(width: 4),
                Text(
                  _isConnected ? 'Connected' : 'Disconnected',
                  style: TextStyle(
                    color: _isConnected ? Colors.greenAccent : Colors.redAccent,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 16),
            _buildSensorGrid(),
            const SizedBox(height: 16),
            _buildGPSCard(),
            const SizedBox(height: 16),
            _buildMissionControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.agriculture, color: Colors.white, size: 35),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AGRO-NOVA Ranger',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status: $_missionStatus',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildSensorCard(
          'Battery',
          '${_batteryLevel.toInt()}%',
          Icons.battery_charging_full,
          _batteryLevel > 20 ? Colors.greenAccent : Colors.redAccent,
        ),
        _buildSensorCard(
          'Soil Moisture',
          '${_soilMoisture.toInt()}%',
          Icons.water_drop,
          Colors.blueAccent,
        ),
        _buildSensorCard(
          'Mission',
          _missionRunning ? 'Running' : 'Stopped',
          Icons.track_changes,
          _missionRunning ? Colors.greenAccent : Colors.orangeAccent,
        ),
        _buildSensorCard(
          'Robot',
          _isConnected ? 'Online' : 'Offline',
          Icons.smart_toy,
          _isConnected ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
  }

  Widget _buildSensorCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGPSCard() {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.redAccent, size: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'GPS Location',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Text(
                  _gpsLocation,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionControls() {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mission Control',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _missionRunning = true;
                        _missionStatus = 'Running';
                        _isConnected = true;
                      });
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start Mission'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _missionRunning = false;
                        _missionStatus = 'Stopped';
                        _isConnected = false;
                      });
                    },
                    icon: const Icon(Icons.stop),
                    label: const Text('Stop Mission'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}