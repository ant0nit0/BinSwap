import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/ui/screens/home_screen.dart';
import 'package:recycling_master/ui/screens/settings_screen.dart';

class Routes {
  static const homeScreen = '/home';
  static const settingsScreen = '/settings';
  static const gameScreen = '/game';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (kDebugMode) print('RouteGenerator.generateRoute: ${settings.name}');
    switch (settings.name) {
      case Routes.homeScreen:
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const HomeScreen(),
        );
      case Routes.settingsScreen:
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const SettingsScreen(),
        );
      case Routes.gameScreen:
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const GameScreen(),
        );
      default:
        return _errorRoute(settings.name ?? '', settings);
    }
  }

  static Route<dynamic> _errorRoute(String name, RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erreur')),
        body: Center(
            child: Text(name.isEmpty
                ? 'No name passed. RouteSettings: $routeSettings'
                : 'View $name not found')),
      ),
    );
  }
}
