import 'package:flutter/material.dart';
import '../utils/app_translations.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isActive = false;
  int _captureCount = 0;
  final List<String> _captures = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            color: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'ESP32-CAM',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Surveillance AGRO-NOVA',
                        style: TextStyle(color: Colors.white38, fontSize: 11),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$_captureCount captures',
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _isActive ? Colors.greenAccent : Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isActive ? 'LIVE' : 'INACTIF',
                    style: TextStyle(
                      color: _isActive ? Colors.greenAccent : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '0 FPS  640x480',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: _isActive
                  ? const Text(
                      'LIVE FEED\n192.168.1.100',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white38, fontSize: 14),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt, color: Colors.white24, size: 60),
                        const SizedBox(height: 12),
                        Text(
                          AppTranslations.get('camera_inactive'),
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 14,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Appuie sur ▶ pour démarrer',
                          style: const TextStyle(color: Colors.white24, fontSize: 12),
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCameraButton(
                Icons.play_arrow,
                AppTranslations.get('start'),
                Colors.greenAccent,
                () => setState(() => _isActive = true),
              ),
              _buildCameraButton(
                Icons.camera,
                AppTranslations.get('capture'),
                Colors.blueAccent,
                _isActive
                    ? () {
                        setState(() {
                          _captureCount++;
                          _captures.add('Capture $_captureCount');
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Capture saved!'),
                            backgroundColor: Color(0xFF2E7D32),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    : null,
              ),
              _buildCameraButton(
                Icons.stop,
                'Stop',
                Colors.redAccent,
                () => setState(() => _isActive = false),
              ),
              _buildCameraButton(
                Icons.delete,
                'Clear',
                Colors.orangeAccent,
                () => setState(() {
                  _captures.clear();
                  _captureCount = 0;
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            color: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SESSION CAPTURES',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _captures.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              const Icon(Icons.camera_alt, color: Colors.white12, size: 40),
                              const SizedBox(height: 8),
                              Text(
                                AppTranslations.get('no_capture'),
                                style: const TextStyle(color: Colors.white24, fontSize: 13),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _captures.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.image, color: Color(0xFF2E7D32)),
                              title: Text(
                                _captures[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: const Icon(Icons.check_circle, color: Colors.greenAccent, size: 16),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraButton(IconData icon, String label, Color color, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: onTap != null ? color.withOpacity(0.2) : Colors.white12,
              shape: BoxShape.circle,
              border: Border.all(
                color: onTap != null ? color : Colors.white12,
                width: 2,
              ),
            ),
            child: Icon(icon, color: onTap != null ? color : Colors.white24, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: onTap != null ? color : Colors.white24,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}