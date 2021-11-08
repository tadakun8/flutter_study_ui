import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.freezed.dart';
part 'counter_state.g.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({int? count, bool? isEnabled}) = _CounterState;
  factory CounterState.fromJson(Map<String, dynamic> json) =>
      _$CounterStateFromJson(json);
}

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(const CounterState(count: 0, isEnabled: true));

  void increment() {
    state = state.copyWith(count: state.count! + 1);
  }

  void reset() {
    state = state.copyWith(count: 0);
  }

  void disableCounter() {
    state = state.copyWith(isEnabled: false);
  }
}

final counterStateProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
        (ref) => CounterStateNotifier());
