import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:recycling_master/l10n/app_localizations.dart';
import 'package:recycling_master/providers/lang.dart';
import 'package:recycling_master/utils/constants.dart';
import 'package:recycling_master/utils/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Put game into full screen mode on mobile devices.
  try {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // Lock the game to portrait mode on mobile devices.
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Transparent status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  } catch (e) {
    // Ignore errors on web platform
  }

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  appRunner();
}

void appRunner() async {
  // For intl package
  initializeDateFormatting().then(
    (_) => runApp(
      // Riverpod
      ProviderScope(
        // Internationalization
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'BinSwap',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff308AD1)),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Il delegate generato dai tuoi file .arb
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 2. Definisci le lingue supportate
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        // Controlla se il locale corrente del dispositivo è supportato
        if (supportedLocales.contains(locale)) {
          return locale; // Se supportato, usa il locale del dispositivo
        }

        // Se NON supportato, restituisci il tuo Locale di default (es. inglese)
        return const Locale('en', ''); // Fallback all'inglese (Locale('en'))
      },
      locale: ref.watch(languageProvider),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}
