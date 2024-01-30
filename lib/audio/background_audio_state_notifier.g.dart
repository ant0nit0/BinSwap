// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_audio_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$backgroundAudioStateNotifierHash() =>
    r'5cb6bbbc48a91eccb1430cb40961b12f02568550';

/// The [BackgroundAudioStateNotifier] is responsible for playing the audio in the background.
///
/// It uses the [BackgroundAudioService] to play the audio.
///
/// It listens to the [AudioSettingsNotifier] to pause or play the audio.
///
/// It listens to the [isUserPlayingProvider] to play the game music or the non-game music.
///
/// Copied from [BackgroundAudioStateNotifier].
@ProviderFor(BackgroundAudioStateNotifier)
final backgroundAudioStateNotifierProvider = AsyncNotifierProvider<
    BackgroundAudioStateNotifier, BackgroundAudioMode>.internal(
  BackgroundAudioStateNotifier.new,
  name: r'backgroundAudioStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$backgroundAudioStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BackgroundAudioStateNotifier = AsyncNotifier<BackgroundAudioMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
