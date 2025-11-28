import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_user_playing.g.dart';

@riverpod
class IsUserPlaying extends _$IsUserPlaying {
  @override
  bool build() {
    return false;
  }

  void setPlaying(bool value) {
    state = value;
  }
}
