// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Shop)
const shopProvider = ShopProvider._();

final class ShopProvider extends $AsyncNotifierProvider<Shop, ShopState> {
  const ShopProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopHash();

  @$internal
  @override
  Shop create() => Shop();
}

String _$shopHash() => r'4b544e46cf82f9cad789752d0c30bd19dac4354e';

abstract class _$Shop extends $AsyncNotifier<ShopState> {
  FutureOr<ShopState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ShopState>, ShopState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ShopState>, ShopState>,
              AsyncValue<ShopState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
