// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_background.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedBackground)
const selectedBackgroundProvider = SelectedBackgroundProvider._();

final class SelectedBackgroundProvider
    extends $AsyncNotifierProvider<SelectedBackground, ShopItem> {
  const SelectedBackgroundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedBackgroundProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedBackgroundHash();

  @$internal
  @override
  SelectedBackground create() => SelectedBackground();
}

String _$selectedBackgroundHash() =>
    r'e5a5f536eec887371ce6cbe1bad5e68f49277e2f';

abstract class _$SelectedBackground extends $AsyncNotifier<ShopItem> {
  FutureOr<ShopItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ShopItem>, ShopItem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ShopItem>, ShopItem>,
              AsyncValue<ShopItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
