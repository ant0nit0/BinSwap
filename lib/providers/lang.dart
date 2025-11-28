import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// Devi ancora importare il tuo provider di settings per il salvataggio
import 'package:recycling_master/providers/settings_preferences.dart';
// Rimuovi l'import di LocalizedApp

part 'lang.g.dart';

@riverpod
class Lang extends _$Lang {
  // Ora memorizziamo il BCP 47 Language Tag completo
  static const supportedLangs = ['fr', 'en', 'it'];
  static const defaultLang = 'en';

  // Lo stato (state) è ora la stringa del codice lingua selezionato
  @override
  String build() {
    // Il valore iniziale è il default, finché non viene caricato dalle preferenze
    return defaultLang;
  }

  // Il widget che userà la lingua ha bisogno dell'oggetto Locale, non della stringa.
  // Creiamo un provider separato per l'oggetto Locale.

  Future<void> initLang() async {
    // Leggiamo la lingua salvata
    final lang = await ref.read(settingsProvider.notifier).getLang();

    // Se esiste, è supportata e diversa dallo stato attuale, la impostiamo.
    if (lang != null && supportedLangs.contains(lang) && lang != state) {
      state = lang;
    }
  }

  Future<void> changeLang(String? lang) async {
    if (lang != null && supportedLangs.contains(lang) && lang != state) {
      state = lang;

      // 1. Salva la nuova lingua nelle preferenze
      await ref.read(settingsProvider.notifier).storeLang(state);

      // 2. Notifica Riverpod del cambio di stato
      // Il widget MaterialApp vedrà il cambio tramite il provider languageProvider
    }
  }
}

// 2. Creiamo un provider che restituisce l'oggetto Locale
// Questo è il provider che userai nel tuo MaterialApp.
@riverpod
Locale language(dynamic ref) {
  // Osserva lo stato della classe Lang
  final langCode = ref.watch(langProvider);
  // Restituisce il Locale corrispondente
  return Locale(langCode);
}
