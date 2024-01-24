import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Put game into full screen mode on mobile devices.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Lock the game to portrait mode on mobile devices.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: LangProvider.langs,
  );

  return appRunner(delegate);
}

void appRunner(LocalizationDelegate delegate) async {
  // Fetch the current language from the delegate
  String currentLang = delegate.currentLocale.languageCode;
  // For intl package
  initializeDateFormatting().then(
    (_) => runApp(
      // Riverpod
      ProviderScope(
        // Pass the current language to the LangProvider
        overrides: [
          langProvider.overrideWith((_) => LangProvider(currentLang)),
        ],
        // Internationalization
        child: LocalizedApp(delegate, const MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return MaterialApp(
      title: 'Recycling Master',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          // FIXME: using a provider
          seedColor: const Color(0xff308AD1),
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        localizationDelegate
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      locale: localizationDelegate.currentLocale,
      initialRoute: Routes.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}
