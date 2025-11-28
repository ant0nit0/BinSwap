// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bins_number.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinsNumber)
const binsNumberProvider = BinsNumberProvider._();

final class BinsNumberProvider extends $NotifierProvider<BinsNumber, int> {
  const BinsNumberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binsNumberProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binsNumberHash();

  @$internal
  @override
  BinsNumber create() => BinsNumber();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$binsNumberHash() => r'2373e834b3da2f1fc25ec9bd286e4c612ffcf268';

abstract class _$BinsNumber extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
