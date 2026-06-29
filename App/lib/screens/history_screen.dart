import 'package:flutter/material.dart';
import '../utils/app_translations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> _missions = [
    {
      'date': 'Mon 14 Apr 2026',
      'time': '07:30 → 10:00',
      'location': 'North Plot A',
      'locationFR': 'Parcelle Nord A',
      'seed': 'Maize',
      'seedFR': 'Maïs',
      'surface': '930 m²',
      'holes': '113 / 121',
      'temperature': '22.3 °C',
      'moisture': '35%',
      'duration': '03:19:00',
      'obstacles': '5',
      'depth': '12 cm',
      'speed': '42%',
    },
    {
      'date': 'Sat 12 Apr 2026',
      'time': '08:00 → 11:30',
      'location': 'West Plot D',
      'locationFR': 'Parcelle Ouest D',
      'seed': 'Bean',
      'seedFR': 'Haricot',
      'surface': '632 m²',
      'holes': '56 / 66',
      'temperature': '22.0 °C',
      'moisture': '43%',
      'duration': '02:33:00',
      'obstacles': '5',
      'depth': '31 cm',
      'speed': '50%',
    },
    {
      'date': 'Thu 10 Apr 2026',
      'time': '06:00 → 09:00',
      'location': 'South Plot B',
      'locationFR': 'Parcelle Sud B',
      'seed': 'Maize',
      'seedFR': 'Maïs',
      'surface': '810 m²',
      'holes': '98 / 105',
      'temperature': '23.1 °C',
      'moisture': '38%',
      'duration': '03:00:00',
      'obstacles': '3',
      'depth': '10 cm',
      'speed': '45%',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final lang = AppTranslations.currentLanguage;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: const Color(0xFF2E7D32),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXPORT RAPPORT',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppTranslations.get('export_pdf')),
                            backgroundColor: const Color(0xFF1B5E20),
                          ),
                        );
                      },
                      icon: const Icon(Icons.picture_as_pdf),
                      label: Text(AppTranslations.get('export_pdf')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF2E7D32),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.list, color: Colors.white54, size: 18),
              const SizedBox(width: 8),
              Text(
                '${_missions.length} ${AppTranslations.get('missions_found')}',
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _missions.length,
            itemBuilder: (context, index) {
              final m = _missions[index];
              return Card(
                color: const Color(0xFF2A2A2A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                m['date'],
                                style: const TextStyle(
                                  color: Color(0xFF2E7D32),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                m['time'],
                                style: const TextStyle(
                                    color: Colors.white54, fontSize: 12),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E7D32),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.check,
                                    color: Colors.white, size: 14),
                                const SizedBox(width: 4),
                                Text(
                                  AppTranslations.get('completed'),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3.5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: [
                          _buildMissionDetail(
                            Icons.location_on,
                            AppTranslations.get('location'),
                            lang == 'EN' ? m['location'] : m['locationFR'],
                            Colors.redAccent,
                          ),
                          _buildMissionDetail(
                            Icons.grass,
                            AppTranslations.get('seed_planted'),
                            lang == 'EN' ? m['seed'] : m['seedFR'],
                            const Color(0xFF2E7D32),
                          ),
                          _buildMissionDetail(
                            Icons.square_foot,
                            AppTranslations.get('surface'),
                            m['surface'],
                            Colors.blueAccent,
                          ),
                          _buildMissionDetail(
                            Icons.circle,
                            AppTranslations.get('holes_dug'),
                            m['holes'],
                            Colors.orangeAccent,
                          ),
                          _buildMissionDetail(
                            Icons.thermostat,
                            AppTranslations.get('temperature'),
                            m['temperature'],
                            Colors.redAccent,
                          ),
                          _buildMissionDetail(
                            Icons.water_drop,
                            AppTranslations.get('soil_moisture'),
                            m['moisture'],
                            Colors.cyanAccent,
                          ),
                          _buildMissionDetail(
                            Icons.timer,
                            AppTranslations.get('duration'),
                            m['duration'],
                            Colors.purpleAccent,
                          ),
                          _buildMissionDetail(
                            Icons.warning_amber,
                            AppTranslations.get('obstacles'),
                            m['obstacles'],
                            Colors.orangeAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMissionDetail(
      IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white38, fontSize: 10),
              ),
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}