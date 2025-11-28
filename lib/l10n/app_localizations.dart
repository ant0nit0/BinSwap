import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('it'),
  ];

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Recycling Master'**
  String get homeTitle;

  /// No description provided for @homeButtonsPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get homeButtonsPlay;

  /// No description provided for @homeButtonsSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get homeButtonsSettings;

  /// No description provided for @homeButtonsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get homeButtonsAbout;

  /// No description provided for @homeButtonsShop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get homeButtonsShop;

  /// No description provided for @onBoarding1.
  ///
  /// In en, this message translates to:
  /// **'Because we can play while learning how to preserve our environment'**
  String get onBoarding1;

  /// No description provided for @onBoarding21.
  ///
  /// In en, this message translates to:
  /// **'Every year, over '**
  String get onBoarding21;

  /// No description provided for @onBoarding22.
  ///
  /// In en, this message translates to:
  /// **'2 billion '**
  String get onBoarding22;

  /// No description provided for @onBoarding23.
  ///
  /// In en, this message translates to:
  /// **'tonnes of waste are produced worldwide.'**
  String get onBoarding23;

  /// No description provided for @onBoarding24.
  ///
  /// In en, this message translates to:
  /// **'On the other hand, only around 10% of waste is recycled.'**
  String get onBoarding24;

  /// No description provided for @onBoarding31.
  ///
  /// In en, this message translates to:
  /// **'BinSwap'**
  String get onBoarding31;

  /// No description provided for @onBoarding32.
  ///
  /// In en, this message translates to:
  /// **'\'s aim is to teach you how to sort waste, so that you can contribute, at your own level, to the preservation of the environment.'**
  String get onBoarding32;

  /// No description provided for @onBoarding33.
  ///
  /// In en, this message translates to:
  /// **'All while having fun, of course!'**
  String get onBoarding33;

  /// No description provided for @onBoardingButton.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go !'**
  String get onBoardingButton;

  /// No description provided for @gameNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get gameNext;

  /// No description provided for @gameScore.
  ///
  /// In en, this message translates to:
  /// **'Score : '**
  String get gameScore;

  /// No description provided for @gameTime.
  ///
  /// In en, this message translates to:
  /// **'Time : '**
  String get gameTime;

  /// No description provided for @gameLevel.
  ///
  /// In en, this message translates to:
  /// **'Level : '**
  String get gameLevel;

  /// No description provided for @gameTuto1Title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to BinSwap !'**
  String get gameTuto1Title;

  /// No description provided for @gameTuto1Description.
  ///
  /// In en, this message translates to:
  /// **'You are going to learn how to play in a few steps. I promise, it will not take more than 30 seconds !'**
  String get gameTuto1Description;

  /// No description provided for @gameTuto2Top.
  ///
  /// In en, this message translates to:
  /// **'In the top part, you can find all the informations you need. The score, level progress, elapsed time and of course some settings buttons. '**
  String get gameTuto2Top;

  /// No description provided for @gameTuto2Bottom.
  ///
  /// In en, this message translates to:
  /// **'If you need some help during the game, you will find all the necessary informations by pressing on the little “i” at the top right of the screen.'**
  String get gameTuto2Bottom;

  /// No description provided for @gameTuto3.
  ///
  /// In en, this message translates to:
  /// **'As you can see, garbages are falling from the sky ! Your goal is to make them fall in the right bin.\nYou can use their background color to help you sort the items, but pay attention, the color ir less visible as far as the game forward.'**
  String get gameTuto3;

  /// No description provided for @gameTuto4Text.
  ///
  /// In en, this message translates to:
  /// **'To make items fall in the right bin, swipe between two columns to change their places !'**
  String get gameTuto4Text;

  /// No description provided for @gameTuto4Button.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get gameTuto4Button;

  /// No description provided for @gameTuto5Text.
  ///
  /// In en, this message translates to:
  /// **'If you feel confident, you can also drag down onto the column you want to accelerate the last item of this column !'**
  String get gameTuto5Text;

  /// No description provided for @gameTuto5Button.
  ///
  /// In en, this message translates to:
  /// **'OKAY'**
  String get gameTuto5Button;

  /// No description provided for @gameTuto6Text.
  ///
  /// In en, this message translates to:
  /// **'Some specials items are also falling down ! If you see one, click on it to activate its power !'**
  String get gameTuto6Text;

  /// No description provided for @gameTuto6Button.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get gameTuto6Button;

  /// No description provided for @gameTuto7Top.
  ///
  /// In en, this message translates to:
  /// **'Well played, you completed the tutorial ! (I\'ve told you it will not be long !)'**
  String get gameTuto7Top;

  /// No description provided for @gameTuto7Bottom.
  ///
  /// In en, this message translates to:
  /// **'You can always get some help in game by pressing the little \"I\" button on the top right of the screen'**
  String get gameTuto7Bottom;

  /// No description provided for @gameTuto7Button.
  ///
  /// In en, this message translates to:
  /// **'PLAY'**
  String get gameTuto7Button;

  /// No description provided for @gameSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get gameSettingsTitle;

  /// No description provided for @gameSettingsLang.
  ///
  /// In en, this message translates to:
  /// **'Lang'**
  String get gameSettingsLang;

  /// No description provided for @gameSettingsAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get gameSettingsAudio;

  /// No description provided for @gameSettingsRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get gameSettingsRestart;

  /// No description provided for @gameSettingsQuit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get gameSettingsQuit;

  /// No description provided for @gameInfosTitle.
  ///
  /// In en, this message translates to:
  /// **'Need some help ?'**
  String get gameInfosTitle;

  /// No description provided for @gameInfosRecyclingGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Recycling guide'**
  String get gameInfosRecyclingGuideTitle;

  /// No description provided for @gameInfosRecyclingGuideNote.
  ///
  /// In en, this message translates to:
  /// **'Note : If you want to change the color attributions, it is possible after your game in the settings screen'**
  String get gameInfosRecyclingGuideNote;

  /// No description provided for @gameInfosRecyclingGuideCurrentTitle.
  ///
  /// In en, this message translates to:
  /// **'In the current game'**
  String get gameInfosRecyclingGuideCurrentTitle;

  /// No description provided for @gameInfosRecyclingGuideOtherTitle.
  ///
  /// In en, this message translates to:
  /// **'Other categories'**
  String get gameInfosRecyclingGuideOtherTitle;

  /// No description provided for @gameInfosButtonsRecycling.
  ///
  /// In en, this message translates to:
  /// **'Recycling guide'**
  String get gameInfosButtonsRecycling;

  /// No description provided for @gameInfosButtonsHow2Play.
  ///
  /// In en, this message translates to:
  /// **'How to play ?'**
  String get gameInfosButtonsHow2Play;

  /// No description provided for @gameInfosHow2playTitle.
  ///
  /// In en, this message translates to:
  /// **'How to play ?'**
  String get gameInfosHow2playTitle;

  /// No description provided for @gameInfosHow2playGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Game\'s goal'**
  String get gameInfosHow2playGoalTitle;

  /// No description provided for @gameInfosHow2playGoalDescription.
  ///
  /// In en, this message translates to:
  /// **'The goal of the game is to sort as many waste items as possible, without making mistakes. Swap the bins around to make the trash fall into the correct bins, and try to survive as long as you can!'**
  String get gameInfosHow2playGoalDescription;

  /// No description provided for @gameInfosHow2playHow2description.
  ///
  /// In en, this message translates to:
  /// **'Swipe between two columns to swap the bins\' places. You lose life every time you make a mistake, but you regain it when trash are sorted correctly. You can also drag down onto the column you want to accelerate the last item of this column. The game ends when you run out of life. Good luck !'**
  String get gameInfosHow2playHow2description;

  /// No description provided for @gameInfosHow2playHow2title.
  ///
  /// In en, this message translates to:
  /// **'Okay, but how ?'**
  String get gameInfosHow2playHow2title;

  /// No description provided for @gameInfosHow2playBonusTitle.
  ///
  /// In en, this message translates to:
  /// **'Bonuses'**
  String get gameInfosHow2playBonusTitle;

  /// No description provided for @gameInfosHow2playBonusDescription.
  ///
  /// In en, this message translates to:
  /// **'Some bonuses are present in the game! If you see one, click on it to activate its effect!'**
  String get gameInfosHow2playBonusDescription;

  /// No description provided for @gameInfosHow2playSnowDescription.
  ///
  /// In en, this message translates to:
  /// **'Slow down the speed of the game for 4 seconds.'**
  String get gameInfosHow2playSnowDescription;

  /// No description provided for @gameInfosHow2playX2Description.
  ///
  /// In en, this message translates to:
  /// **'Double the score of the next items sorted for 10 seconds.'**
  String get gameInfosHow2playX2Description;

  /// No description provided for @gameInfosBinsPlasticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Plastics'**
  String get gameInfosBinsPlasticsTitle;

  /// No description provided for @gameInfosBinsPlasticsDescription.
  ///
  /// In en, this message translates to:
  /// **'Recycling plastics reduces pollution, conserves resources, and minimizes the impact on wildlife and the environment.'**
  String get gameInfosBinsPlasticsDescription;

  /// No description provided for @gameInfosBinsOrganicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Organics'**
  String get gameInfosBinsOrganicsTitle;

  /// No description provided for @gameInfosBinsOrganicsDescription.
  ///
  /// In en, this message translates to:
  /// **'Recycling organic waste into compost enriches soil, reduces the need for chemical fertilizers, and decreases methane emissions from landfills.'**
  String get gameInfosBinsOrganicsDescription;

  /// No description provided for @gameInfosBinsElectronicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get gameInfosBinsElectronicsTitle;

  /// No description provided for @gameInfosBinsElectronicsDescription.
  ///
  /// In en, this message translates to:
  /// **'Proper recycling of e-waste prevents the release of toxic substances into the environment and recovers valuable materials.'**
  String get gameInfosBinsElectronicsDescription;

  /// No description provided for @gameInfosBinsGlassTitle.
  ///
  /// In en, this message translates to:
  /// **'Glass'**
  String get gameInfosBinsGlassTitle;

  /// No description provided for @gameInfosBinsGlassDescription.
  ///
  /// In en, this message translates to:
  /// **'Glass can be recycled indefinitely without loss of quality, reducing raw material use and lowering energy consumption.'**
  String get gameInfosBinsGlassDescription;

  /// No description provided for @gameInfosBinsPapersTitle.
  ///
  /// In en, this message translates to:
  /// **'Papers'**
  String get gameInfosBinsPapersTitle;

  /// No description provided for @gameInfosBinsPapersDescription.
  ///
  /// In en, this message translates to:
  /// **'Recycling paper conserves trees and forest habitats, reduces greenhouse gas emissions, and saves energy compared to producing new paper.'**
  String get gameInfosBinsPapersDescription;

  /// No description provided for @gameInfosBinsTextilesTitle.
  ///
  /// In en, this message translates to:
  /// **'Textiles'**
  String get gameInfosBinsTextilesTitle;

  /// No description provided for @gameInfosBinsTextilesDescription.
  ///
  /// In en, this message translates to:
  /// **'Recycling textiles reduces landfill waste, saves resources, and decreases the environmental impact of producing new fabrics.'**
  String get gameInfosBinsTextilesDescription;

  /// No description provided for @endGameTitle.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get endGameTitle;

  /// No description provided for @endGameScore.
  ///
  /// In en, this message translates to:
  /// **'Your score :'**
  String get endGameScore;

  /// No description provided for @endGameHighScore.
  ///
  /// In en, this message translates to:
  /// **'Your highScore :'**
  String get endGameHighScore;

  /// No description provided for @endGameButtonsRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get endGameButtonsRestart;

  /// No description provided for @endGameButtonsHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get endGameButtonsHome;

  /// No description provided for @endGameButtonsQuit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get endGameButtonsQuit;

  /// No description provided for @endGameLeaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Your best scores'**
  String get endGameLeaderboardTitle;

  /// No description provided for @shopTitle.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shopTitle;

  /// No description provided for @shopSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You have : '**
  String get shopSubtitle;

  /// No description provided for @shopBackgrounds.
  ///
  /// In en, this message translates to:
  /// **'Backgrounds'**
  String get shopBackgrounds;

  /// No description provided for @shopPopupTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy {name} ?'**
  String shopPopupTitle(Object name);

  /// No description provided for @shopPopupDescriptionCanbuy.
  ///
  /// In en, this message translates to:
  /// **'Do you want to buy {name} for {price} coins ?'**
  String shopPopupDescriptionCanbuy(Object name, Object price);

  /// No description provided for @shopPopupDescriptionCantbuy.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough coins to buy {name}.'**
  String shopPopupDescriptionCantbuy(Object name);

  /// No description provided for @shopPopupYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get shopPopupYes;

  /// No description provided for @shopPopupNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get shopPopupNo;

  /// No description provided for @shopPopupCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get shopPopupCancel;

  /// No description provided for @settingsColorAttributions.
  ///
  /// In en, this message translates to:
  /// **'Bin colors'**
  String get settingsColorAttributions;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLang.
  ///
  /// In en, this message translates to:
  /// **'Lang'**
  String get settingsLang;

  /// No description provided for @settingsAudio.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get settingsAudio;

  /// No description provided for @settingsResetLeaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset leaderboard'**
  String get settingsResetLeaderboardTitle;

  /// No description provided for @settingsResetLeaderboardDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset your leaderboard ?'**
  String get settingsResetLeaderboardDescription;

  /// No description provided for @settingsResetLeaderboardYes.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get settingsResetLeaderboardYes;

  /// No description provided for @settingsResetLeaderboardNo.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsResetLeaderboardNo;

  /// No description provided for @settingsSfx.
  ///
  /// In en, this message translates to:
  /// **'SFX'**
  String get settingsSfx;

  /// No description provided for @settingsColorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Color distribution'**
  String get settingsColorsTitle;

  /// No description provided for @settingsColorsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match the colors of your region with the game ! Click on a category to choose its color.'**
  String get settingsColorsSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
