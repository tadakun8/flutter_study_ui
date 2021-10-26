import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'counter_state.freezed.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({int? count, bool? isEnabled}) = _CounterState;
}

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(const CounterState(count: 0, isEnabled: true));

  void increment() {
    state = state.copyWith(count: state.count! + 1);
  }

  void disableCounter() {
    state = state.copyWith(isEnabled: false);
  }
}

final counterStateProvier =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
  (ref) => CounterStateNotifier(),
);
