// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Coins)
const coinsProvider = CoinsProvider._();

final class CoinsProvider extends $AsyncNotifierProvider<Coins, int> {
  const CoinsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coinsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coinsHash();

  @$internal
  @override
  Coins create() => Coins();
}

String _$coinsHash() => r'6dac25aea04b1d0128c92e914d36a41389d99aa6';

abstract class _$Coins extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
