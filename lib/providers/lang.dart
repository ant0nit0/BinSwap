import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/providers/settings_preferences.dart';
import 'package:riverpod/riverpod.dart';

class LangProvider extends StateNotifier<String> {
  static const langs = ['fr', 'en'];

  final Ref _ref;

  LangProvider(
    this._ref, [
    super.initialLang = 'en',
  ]);

  Future<void> initLang(context) async {
    final lang = await _ref.read(settingsNotifierProvider.notifier).getLang();

    if (lang != null && langs.contains(lang) && lang != state) {
      state = lang;
      await LocalizedApp.of(context).delegate.changeLocale(Locale(state));
    }
  }

  void changeLang(String? lang, BuildContext context) async {
    if (lang != null && langs.contains(lang) && lang != state) {
      state = lang;

      var delegate = LocalizedApp.of(context).delegate; // Access context
      await delegate.changeLocale(Locale(state));

      // Save the new language to the storage
      await _ref.read(settingsNotifierProvider.notifier).storeLang(state);
    }
  }
}

final langProvider = StateNotifierProvider<LangProvider, String>((ref) {
  return LangProvider(ref);
});
