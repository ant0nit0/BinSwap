// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameStateNotifier)
const gameStateProvider = GameStateNotifierProvider._();

final class GameStateNotifierProvider
    extends $AsyncNotifierProvider<GameStateNotifier, GameState> {
  const GameStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameStateNotifierHash();

  @$internal
  @override
  GameStateNotifier create() => GameStateNotifier();
}

String _$gameStateNotifierHash() => r'11166517b370542bb55bffa259718b6846d126fa';

abstract class _$GameStateNotifier extends $AsyncNotifier<GameState> {
  FutureOr<GameState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<GameState>, GameState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GameState>, GameState>,
              AsyncValue<GameState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
