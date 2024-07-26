part of '../adapters.dart';


class AutoInjectorImpl implements IInjector {
  final _autoInjector = AutoInjector();

  @override
  add<T extends Object>(Function constructor) {
    _autoInjector.add<T>(constructor(), key: T.toString());
  }

  @override
  addSingleton<T extends Object>(Function constructor) {
    _autoInjector.addSingleton<T>(constructor());
  }

  @override
  T get<T extends Object>() {
    return _autoInjector.get<T>();
  }

  @override
  void unregister<T extends Object>(T instance) {
    _autoInjector.disposeInjectorByTag(T.toString());
  }

  void commit() {
    _autoInjector.commit();
  }
}
