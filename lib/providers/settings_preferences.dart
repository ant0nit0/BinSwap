import 'package:recycling_master/models/settings_preferences.dart';
import 'package:recycling_master/providers/storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_preferences.g.dart';

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  FutureOr<SettingsPreferences> build() async {
    state = const AsyncLoading();

    await _loadFromLocalStorage();

    return state.requireValue;
  }

  Future<void> _loadFromLocalStorage() async {
    final storage = ref.read(storageServiceProvider).storage;
    final audioBackground =
        await storage.read(key: StorageKeys.audioBackground);
    final sfxsEffects = await storage.read(key: StorageKeys.sfxsEffects);
    final lang = await storage.read(key: StorageKeys.lang);

    state = AsyncData(
      SettingsPreferences(
        isBackgroundAudioActivated:
            audioBackground == null || audioBackground == 'true',
        areSfxsEffectsActivated: sfxsEffects == null || sfxsEffects == 'true',
        language: lang,
      ),
    );
  }

  Future<void> storeLang(String lang) async {
    await ref
        .read(storageServiceProvider)
        .storage
        .write(key: StorageKeys.lang, value: lang);
    state = AsyncData(state.requireValue.copyWith(language: lang));
  }

  Future<String?> getLang() async {
    return await ref
        .read(storageServiceProvider)
        .storage
        .read(key: StorageKeys.lang);
  }

  Future<void> deactivateBackgroundAudio() async {
    await ref
        .read(storageServiceProvider)
        .storage
        .write(key: StorageKeys.audioBackground, value: 'false');
    state = AsyncData(
        state.requireValue.copyWith(isBackgroundAudioActivated: false));
  }

  Future<void> activateBackgroundAudio() async {
    await ref
        .read(storageServiceProvider)
        .storage
        .write(key: StorageKeys.audioBackground, value: 'true');
    state = AsyncData(
        state.requireValue.copyWith(isBackgroundAudioActivated: true));
  }

  Future<void> deactivateSfxsEffects() async {
    await ref
        .read(storageServiceProvider)
        .storage
        .write(key: StorageKeys.sfxsEffects, value: 'false');
    state =
        AsyncData(state.requireValue.copyWith(areSfxsEffectsActivated: false));
  }

  Future<void> activateSfxsEffects() async {
    await ref
        .read(storageServiceProvider)
        .storage
        .write(key: StorageKeys.sfxsEffects, value: 'true');
    state =
        AsyncData(state.requireValue.copyWith(areSfxsEffectsActivated: true));
  }
}
