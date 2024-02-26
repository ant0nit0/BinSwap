import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycling_master/ui/screens/color_distribution_screen.dart';
import 'package:recycling_master/ui/screens/dev_settings.dart';
import 'package:recycling_master/ui/screens/game_screen.dart';
import 'package:recycling_master/ui/screens/home_screen.dart';
import 'package:recycling_master/ui/screens/onboarding_screen.dart';
import 'package:recycling_master/ui/screens/settings_screen.dart';
import 'package:recycling_master/ui/screens/shop_screen.dart';
import 'package:recycling_master/ui/screens/splash_screen.dart';
import 'package:recycling_master/utils/route_bottom_transition.dart';

class Routes {
  static const homeScreen = '/home';
  static const settingsScreen = '/settings';
  static const gameScreen = '/game';
  static const splashScreen = '/splash';
  static const devSettingsScreen = '/dev';
  static const colorAttributions = '/colors';
  static const shop = '/shop';
  static const onBoarding = '/onboarding';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (kDebugMode) print('RouteGenerator.generateRoute: ${settings.name}');
    switch (settings.name) {
      case Routes.homeScreen:
        try {
          final comeFromSplash = settings.arguments as bool;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                HomeScreen(comeFromSplash: comeFromSplash),
          );
        } catch (e) {
          return BottomToTopPageRoute(
            page: const HomeScreen(comeFromSplash: false),
          );
        }
      case Routes.settingsScreen:
        return BottomToTopPageRoute(
          page: const SettingsScreen(),
        );
      case Routes.gameScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const GameScreen(),
        );
      case Routes.splashScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SplashScreen(),
        );
      case Routes.devSettingsScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DevSettingsScreen(),
        );
      case Routes.colorAttributions:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ColorDistributionScreen(),
        );
      case Routes.shop:
        return BottomToTopPageRoute(
          page: const ShopScreen(),
        );
      case Routes.onBoarding:
        return BottomToTopPageRoute(page: const OnBoardingScreen());
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
