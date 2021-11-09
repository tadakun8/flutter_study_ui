import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/state/counter_state.dart';

void main() {
  group('CounterStateNotifier', () {
    late CounterStateNotifier counterStateNotifier;
    setUp(() {
      counterStateNotifier = CounterStateNotifier();
    });

    test('init state', () {
      expect(
        counterStateNotifier.debugState,
        const CounterState(count: 0, isEnabled: true),
      );
    });

    test('increment', () {
      counterStateNotifier.increment();
      expect(
        counterStateNotifier.debugState,
        const CounterState(count: 1, isEnabled: true),
      );
    });

    test('reset', () {
      counterStateNotifier.increment();
      counterStateNotifier.increment();
      counterStateNotifier.increment();

      counterStateNotifier.reset();

      expect(
        counterStateNotifier.debugState,
        const CounterState(count: 0, isEnabled: true),
      );
    });

    test('disableCounter', () {
      counterStateNotifier.disableCounter();
      expect(
        counterStateNotifier.debugState,
        const CounterState(count: 0, isEnabled: false),
      );
    });
  });

  group('CounterStateProvider', () {
    late ProviderContainer providerContainer;

    setUp(() {
      providerContainer = ProviderContainer();
    });

    test('return CounterState', () {
      expect(
        providerContainer.read(counterStateProvider),
        const CounterState(count: 0, isEnabled: true),
      );
    });

    test('return CounterStateNotifier', () {
      expect(
        providerContainer.read(counterStateProvider.notifier),
        isA<CounterStateNotifier>(),
      );
    });
  });
}
