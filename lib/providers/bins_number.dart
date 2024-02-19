import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bins_number.g.dart';

@Riverpod(keepAlive: true)
class BinsNumber extends _$BinsNumber {
  @override
  int build() {
    return 3;
  }

  void setExpertMode() {
    state = 4;
  }

  void setNormalMode() {
    state = 3;
  }
}
