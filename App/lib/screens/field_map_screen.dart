import 'package:flutter/material.dart';
import '../utils/app_translations.dart';

class FieldMapScreen extends StatefulWidget {
  const FieldMapScreen({super.key});

  @override
  State<FieldMapScreen> createState() => _FieldMapScreenState();
}

class _FieldMapScreenState extends State<FieldMapScreen> {
  final int _rows = 8;
  final int _cols = 8;
  int _robotRow = 0;
  int _robotCol = 0;

  final List<List<String>> _grid = List.generate(
    8,
    (r) => List.generate(8, (c) => 'planned'),
  );

  @override
  void initState() {
    super.initState();
    _grid[1][1] = 'dug';
    _grid[1][3] = 'dug';
    _grid[2][2] = 'dug';
    _grid[2][5] = 'dug';
    _grid[3][1] = 'dug';
    _grid[3][4] = 'obstacle';
    _grid[4][2] = 'dug';
    _grid[4][6] = 'obstacle';
    _grid[5][3] = 'dug';
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTranslations.get('field_map_title'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTranslations.get('legend'),
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildLegendItem(Colors.orangeAccent, AppTranslations.get('robot_pos')),
                          _buildLegendItem(const Color(0xFF2E7D32), AppTranslations.get('dug_hole')),
                          _buildLegendItem(Colors.white24, AppTranslations.get('planned_hole')),
                          _buildLegendItem(Colors.redAccent, AppTranslations.get('obstacle')),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: _cols,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: _rows * _cols,
                            itemBuilder: (context, index) {
                              final row = index ~/ _cols;
                              final col = index % _cols;
                              final isRobot = row == _robotRow && col == _robotCol;
                              final cellType = _grid[row][col];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _robotRow = row;
                                    _robotCol = col;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isRobot
                                        ? Colors.orangeAccent
                                        : cellType == 'dug'
                                            ? const Color(0xFF2E7D32)
                                            : cellType == 'obstacle'
                                                ? Colors.redAccent
                                                : Colors.white12,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: isRobot
                                      ? const Icon(Icons.agriculture, color: Colors.white, size: 12)
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(Icons.location_on, '3.8480° N', 'LAT'),
                  _buildStatItem(Icons.location_on, '11.5021° E', 'LON'),
                  _buildStatItem(Icons.battery_charging_full, '78%', AppTranslations.get('battery')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF2E7D32), size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 11),
        ),
      ],
    );
  }
}