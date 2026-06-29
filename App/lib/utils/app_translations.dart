class AppTranslations {
  static String currentLanguage = 'EN';

  static void toggle() {
    currentLanguage = currentLanguage == 'EN' ? 'FR' : 'EN';
  }

  static String get(String key) {
    return _translations[key]?[currentLanguage] ?? key;
  }

  static const Map<String, Map<String, String>> _translations = {
    // App
    'app_name': {'EN': 'AGRO-NOVA Control', 'FR': 'AGRO-NOVA Contrôle'},
    'subtitle': {'EN': 'Intelligent Agricultural Robot', 'FR': 'Robot Agricole Intelligent'},

    // Navigation
    'dashboard': {'EN': 'Dashboard', 'FR': 'Tableau de bord'},
    'field_map': {'EN': 'Field Map', 'FR': 'Carte Terrain'},
    'statistics': {'EN': 'Statistics', 'FR': 'Statistiques'},
    'history': {'EN': 'History', 'FR': 'Historique'},
    'seeds': {'EN': 'Seeds', 'FR': 'Graines'},
    'camera': {'EN': 'Camera', 'FR': 'Caméra'},

    // Status
    'connected': {'EN': 'Connected', 'FR': 'Connecté'},
    'disconnected': {'EN': 'Disconnected', 'FR': 'Déconnecté'},
    'online': {'EN': 'Online', 'FR': 'En ligne'},
    'offline': {'EN': 'Offline', 'FR': 'Hors ligne'},
    'idle': {'EN': 'Idle', 'FR': 'En attente'},
    'running': {'EN': 'Running', 'FR': 'En cours'},
    'stopped': {'EN': 'Stopped', 'FR': 'Arrêté'},

    // Dashboard
    'battery': {'EN': 'Battery', 'FR': 'Batterie'},
    'soil_moisture': {'EN': 'Soil Moisture', 'FR': 'Humidité Sol'},
    'mission': {'EN': 'Mission', 'FR': 'Mission'},
    'robot': {'EN': 'Robot', 'FR': 'Robot'},
    'gps_location': {'EN': 'GPS Location', 'FR': 'Position GPS'},
    'mission_control': {'EN': 'Mission Control', 'FR': 'Contrôle Mission'},
    'start_mission': {'EN': 'Start Mission', 'FR': 'Démarrer Mission'},
    'stop_mission': {'EN': 'Stop Mission', 'FR': 'Arrêter Mission'},
    'status': {'EN': 'Status', 'FR': 'Statut'},

    // Seeds
    'maize': {'EN': 'Maize', 'FR': 'Maïs'},
    'bean': {'EN': 'Bean', 'FR': 'Haricot'},
    'future': {'EN': 'Future', 'FR': 'Futur'},
    'selected': {'EN': 'Selected', 'FR': 'Sélectionné'},
    'depth': {'EN': 'Depth', 'FR': 'Profondeur'},
    'seed_selected': {'EN': 'Seed selected!', 'FR': 'Graine sélectionnée!'},

    // Field Map
    'field_map_title': {'EN': 'Field Map', 'FR': 'Carte Terrain'},
    'legend': {'EN': 'Legend', 'FR': 'Légende'},
    'robot_pos': {'EN': 'Robot', 'FR': 'Robot'},
    'dug_hole': {'EN': 'Dug Hole', 'FR': 'Trou creusé'},
    'planned_hole': {'EN': 'Planned Hole', 'FR': 'Trou planifié'},
    'obstacle': {'EN': 'Obstacle', 'FR': 'Obstacle'},

    // Statistics
    'holes_dug': {'EN': 'Holes Dug', 'FR': 'Trous Creusés'},
    'progress': {'EN': 'Progress', 'FR': 'Progression'},
    'area_covered': {'EN': 'Area Covered', 'FR': 'Surface Couverte'},
    'elapsed_time': {'EN': 'Elapsed Time', 'FR': 'Temps Écoulé'},
    'temperature': {'EN': 'Temperature', 'FR': 'Température'},
    'digging_speed': {'EN': 'Digging Speed', 'FR': 'Vitesse Creusage'},
    'obstacles': {'EN': 'Obstacles', 'FR': 'Obstacles'},

    // History
    'export_pdf': {'EN': 'Download PDF', 'FR': 'Télécharger PDF'},
    'missions_found': {'EN': 'missions found', 'FR': 'missions trouvées'},
    'search': {'EN': 'Search', 'FR': 'Rechercher'},
    'completed': {'EN': 'Completed', 'FR': 'Terminée'},
    'location': {'EN': 'Location', 'FR': 'Lieu'},
    'seed_planted': {'EN': 'Seed Planted', 'FR': 'Graine Semée'},
    'surface': {'EN': 'Surface', 'FR': 'Surface'},
    'duration': {'EN': 'Duration', 'FR': 'Durée'},

    // Camera
    'camera_inactive': {'EN': 'Camera Inactive', 'FR': 'Caméra Inactive'},
    'start': {'EN': 'Start', 'FR': 'Démarrer'},
    'capture': {'EN': 'Capture', 'FR': 'Capturer'},
    'no_capture': {'EN': 'No capture', 'FR': 'Aucune capture'},
  };
}