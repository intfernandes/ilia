import 'package:flutter/foundation.dart';
import 'package:ilia/infra/shared/state/i_state.dart';

abstract class IController<T extends IState> implements ValueListenable<T> {
  late final ValueNotifier<T> _stateNotifier;

  T get state => _stateNotifier.value;

  @override
  T get value => _stateNotifier.value;

  IController(T initialState) {
    _stateNotifier = ValueNotifier<T>(initialState);
  }

  @override
  void addListener(VoidCallback listener) {
    _stateNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateNotifier.removeListener(listener);
  }

  void update(T newState) {
    _stateNotifier.value = newState;
  }

  void dispose() {
    _stateNotifier.dispose();
  }
}
