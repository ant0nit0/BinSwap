// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_user_playing.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsUserPlaying)
const isUserPlayingProvider = IsUserPlayingProvider._();

final class IsUserPlayingProvider
    extends $NotifierProvider<IsUserPlaying, bool> {
  const IsUserPlayingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isUserPlayingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isUserPlayingHash();

  @$internal
  @override
  IsUserPlaying create() => IsUserPlaying();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isUserPlayingHash() => r'473d14d9fa14b84549fdbaa58d117a67ea2d4895';

abstract class _$IsUserPlaying extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
