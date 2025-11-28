// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bin_colors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinColors)
const binColorsProvider = BinColorsProvider._();

final class BinColorsProvider
    extends $AsyncNotifierProvider<BinColors, Map<BinCategory, BinColor>> {
  const BinColorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binColorsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binColorsHash();

  @$internal
  @override
  BinColors create() => BinColors();
}

String _$binColorsHash() => r'28aa23fb6038634d576a58e3868f07c0b2a43020';

abstract class _$BinColors extends $AsyncNotifier<Map<BinCategory, BinColor>> {
  FutureOr<Map<BinCategory, BinColor>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<BinCategory, BinColor>>,
              Map<BinCategory, BinColor>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<BinCategory, BinColor>>,
                Map<BinCategory, BinColor>
              >,
              AsyncValue<Map<BinCategory, BinColor>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
