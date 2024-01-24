import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:riverpod/riverpod.dart';

class LangProvider extends StateNotifier<String> {
  static const langs = ['fr', 'en'];
  LangProvider([super.initialLang = 'en']);

  void changeLang(String? lang, BuildContext context) async {
    if (lang != null && langs.contains(lang) && lang != state) {
      state = lang;
    }

    var delegate = LocalizedApp.of(context).delegate; // Access context
    await delegate.changeLocale(Locale(state));
  }
}

final langProvider = StateNotifierProvider<LangProvider, String>((ref) {
  return LangProvider();
});
