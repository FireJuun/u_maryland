import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@riverpod
class HomeIndex extends _$HomeIndex {
  @override
  int build() => 0;

  void setValue(int value) => state = value;
}
