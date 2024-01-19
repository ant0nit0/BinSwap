import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Put game into full screen mode on mobile devices.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Lock the game to portrait mode on mobile devices.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['fr', 'en'],
  );

  return appRunner(delegate);
}

void appRunner(LocalizationDelegate delegate) async {
  initializeDateFormatting().then((_) => // For intl package
      runApp(ProviderScope(child: LocalizedApp(delegate, const MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          // FIXME: using a provider
          seedColor: const Color(0xff308AD1),
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}
