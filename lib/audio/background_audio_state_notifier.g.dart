// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_audio_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
///
/// It uses the [BackgroundAudioService] to play the audio.
///
/// It listens to the [SettingsNotifier] to pause or play the audio.

@ProviderFor(BackgroundAudioStateNotifier)
const backgroundAudioStateProvider = BackgroundAudioStateNotifierProvider._();

/// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
///
/// It uses the [BackgroundAudioService] to play the audio.
///
/// It listens to the [SettingsNotifier] to pause or play the audio.
final class BackgroundAudioStateNotifierProvider
    extends
        $AsyncNotifierProvider<
          BackgroundAudioStateNotifier,
          BackgroundAudioMode
        > {
  /// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
  ///
  /// It uses the [BackgroundAudioService] to play the audio.
  ///
  /// It listens to the [SettingsNotifier] to pause or play the audio.
  const BackgroundAudioStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backgroundAudioStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backgroundAudioStateNotifierHash();

  @$internal
  @override
  BackgroundAudioStateNotifier create() => BackgroundAudioStateNotifier();
}

String _$backgroundAudioStateNotifierHash() =>
    r'8b7ab3957cb7e99abbb42404212184f9627b0e86';

/// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
///
/// It uses the [BackgroundAudioService] to play the audio.
///
/// It listens to the [SettingsNotifier] to pause or play the audio.

abstract class _$BackgroundAudioStateNotifier
    extends $AsyncNotifier<BackgroundAudioMode> {
  FutureOr<BackgroundAudioMode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<BackgroundAudioMode>, BackgroundAudioMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BackgroundAudioMode>, BackgroundAudioMode>,
              AsyncValue<BackgroundAudioMode>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
