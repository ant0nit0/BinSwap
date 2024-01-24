import 'package:riverpod/riverpod.dart';

class LangProvider extends StateNotifier<String> {
  static const langs = ['fr', 'en'];
  LangProvider() : super('en');

  void changeLang(String? lang) {
    // TODO : Implement translation onto the app
    if (lang != null && langs.contains(lang) && lang != state) {
      state = lang;
    }
  }
}

final langProvider = StateNotifierProvider<LangProvider, String>((ref) {
  return LangProvider();
});
