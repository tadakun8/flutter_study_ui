import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.freezed.dart';

// stateの型
@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({int? count, bool? isEnabled}) = _CounterState;
}

// stateの値を変更するクラス
class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(const CounterState(count: 0, isEnabled: true));

  void increment() {
    state = state.copyWith(count: state.count! + 1);
  }

  void disableCounter() {
    state = state.copyWith(isEnabled: false);
  }
}

// stateとstateの値を変更するクラスを提供
final countStateProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
  (ref) => CounterStateNotifier(),
);
