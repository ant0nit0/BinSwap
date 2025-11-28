// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TutorialStateNotifier)
const tutorialStateProvider = TutorialStateNotifierProvider._();

final class TutorialStateNotifierProvider
    extends $NotifierProvider<TutorialStateNotifier, TutorialStep> {
  const TutorialStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tutorialStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tutorialStateNotifierHash();

  @$internal
  @override
  TutorialStateNotifier create() => TutorialStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TutorialStep value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TutorialStep>(value),
    );
  }
}

String _$tutorialStateNotifierHash() =>
    r'903cc2873c9f58406c042214931d0f624a000c9f';

abstract class _$TutorialStateNotifier extends $Notifier<TutorialStep> {
  TutorialStep build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TutorialStep, TutorialStep>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TutorialStep, TutorialStep>,
              TutorialStep,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
