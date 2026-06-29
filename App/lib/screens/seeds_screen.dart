import 'package:flutter/material.dart';
import '../utils/app_translations.dart';

class SeedsScreen extends StatefulWidget {
  const SeedsScreen({super.key});

  @override
  State<SeedsScreen> createState() => _SeedsScreenState();
}

class _SeedsScreenState extends State<SeedsScreen> {
  String _selectedSeed = 'maize';

  final List<Map<String, dynamic>> _seeds = [
    {
      'id': 'maize',
      'nameEN': 'Maize',
      'nameFR': 'Maïs',
      'icon': Icons.grass,
      'depth': '5 cm',
      'color': Color(0xFFFFD700),
      'active': true,
    },
    {
      'id': 'bean',
      'nameEN': 'Bean',
      'nameFR': 'Haricot',
      'icon': Icons.eco,
      'depth': '4 cm',
      'color': Color(0xFF4CAF50),
      'active': true,
    },
    {
      'id': 'rice',
      'nameEN': 'Rice',
      'nameFR': 'Riz',
      'icon': Icons.grain,
      'depth': '3 cm',
      'color': Colors.white38,
      'active': false,
    },
    {
      'id': 'sorghum',
      'nameEN': 'Sorghum',
      'nameFR': 'Sorgho',
      'icon': Icons.nature,
      'depth': '4 cm',
      'color': Colors.white38,
      'active': false,
    },
    {
      'id': 'groundnut',
      'nameEN': 'Groundnut',
      'nameFR': 'Arachide',
      'icon': Icons.spa,
      'depth': '8 cm',
      'color': Colors.white38,
      'active': false,
    },
    {
      'id': 'cassava',
      'nameEN': 'Cassava',
      'nameFR': 'Manioc',
      'icon': Icons.yard,
      'depth': '10 cm',
      'color': Colors.white38,
      'active': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final lang = AppTranslations.currentLanguage;
    final selected = _seeds.firstWhere((s) => s['id'] == _selectedSeed);

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
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: selected['color'],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(selected['icon'], color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang == 'EN' ? selected['nameEN'] : selected['nameFR'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${AppTranslations.get('depth')}: ${selected['depth']}',
                        style: const TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      AppTranslations.get('selected'),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            AppTranslations.get('seeds'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: _seeds.length,
            itemBuilder: (context, index) {
              final seed = _seeds[index];
              final isSelected = _selectedSeed == seed['id'];
              final isActive = seed['active'] as bool;
              return GestureDetector(
                onTap: isActive
                    ? () {
                        setState(() {
                          _selectedSeed = seed['id'];
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppTranslations.get('seed_selected')),
                            backgroundColor: const Color(0xFF2E7D32),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    : null,
                child: Card(
                  color: isSelected
                      ? const Color(0xFF2E7D32).withOpacity(0.3)
                      : const Color(0xFF2A2A2A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: isSelected
                        ? const BorderSide(color: Color(0xFF2E7D32), width: 2)
                        : BorderSide.none,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          seed['icon'],
                          color: isActive ? seed['color'] : Colors.white24,
                          size: 36,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          lang == 'EN' ? seed['nameEN'] : seed['nameFR'],
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.white38,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        isActive
                            ? Text(
                                '${AppTranslations.get('depth')}: ${seed['depth']}',
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  AppTranslations.get('future'),
                                  style: const TextStyle(
                                    color: Colors.white38,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}