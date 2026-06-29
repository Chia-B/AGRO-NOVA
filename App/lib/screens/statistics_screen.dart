import 'package:flutter/material.dart';
import '../utils/app_translations.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final int _totalHoles = 120;
  final int _dugHoles = 6;
  final double _areaCovered = 0.96;
  final String _elapsedTime = '00:09';
  final double _soilTemp = 24.1;
  final double _soilMoisture = 41.0;
  final int _obstacles = 1;
  final int _diggingSpeed = 220;
  final bool _toolActive = true;

  double get _progress => (_dugHoles / _totalHoles) * 100;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: [
              _buildStatCard(
                Icons.circle,
                '$_dugHoles / $_totalHoles',
                AppTranslations.get('holes_dug'),
                Colors.blueAccent,
              ),
              _buildProgressCard(),
              _buildStatCard(
                Icons.grass,
                '$_areaCovered m²',
                AppTranslations.get('area_covered'),
                const Color(0xFF2E7D32),
              ),
              _buildStatCard(
                Icons.warning_amber,
                '$_obstacles',
                AppTranslations.get('obstacles'),
                Colors.orangeAccent,
              ),
              _buildStatCard(
                Icons.timer,
                _elapsedTime,
                AppTranslations.get('elapsed_time'),
                Colors.purpleAccent,
              ),
              _buildStatCard(
                Icons.water_drop,
                '${_soilMoisture.toInt()}%',
                AppTranslations.get('soil_moisture'),
                Colors.cyanAccent,
              ),
              _buildStatCard(
                Icons.thermostat,
                '$_soilTemp °C',
                AppTranslations.get('temperature'),
                Colors.redAccent,
              ),
              _buildToolCard(),
            ],
          ),
          const SizedBox(height: 16),
          _buildSpeedCard(),
        ],
      ),
    );
  }
  Widget _buildStatCard(IconData icon, String value, String label, Color color) {
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
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    value: _progress / 100,
                    backgroundColor: Colors.white12,
                    color: const Color(0xFF2E7D32),
                    strokeWidth: 6,
                  ),
                ),
                Text(
                  '${_progress.toInt()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              AppTranslations.get('progress'),
              style: const TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard() {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              color: _toolActive ? Colors.greenAccent : Colors.redAccent,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              _toolActive ? 'ACTIVE' : 'INACTIVE',
              style: TextStyle(
                color: _toolActive ? Colors.greenAccent : Colors.redAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Digging Tool',
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeedCard() {
    return Card(
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppTranslations.get('digging_speed'),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  '$_diggingSpeed holes/h',
                  style: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: _diggingSpeed / 300,
              backgroundColor: Colors.white12,
              color: const Color(0xFF2E7D32),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}