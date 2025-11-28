// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Leaderboard)
const leaderboardProvider = LeaderboardProvider._();

final class LeaderboardProvider
    extends $AsyncNotifierProvider<Leaderboard, List<Score>> {
  const LeaderboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardHash();

  @$internal
  @override
  Leaderboard create() => Leaderboard();
}

String _$leaderboardHash() => r'98b34ec30480a5e4f0f338795f524aaf4fd61feb';

abstract class _$Leaderboard extends $AsyncNotifier<List<Score>> {
  FutureOr<List<Score>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Score>>, List<Score>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Score>>, List<Score>>,
              AsyncValue<List<Score>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
