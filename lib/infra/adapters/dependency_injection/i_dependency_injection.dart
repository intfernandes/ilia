abstract class IInjector {
  void add<T extends Object>(Function constructor);
  void addSingleton<T extends Object>(Function constructor);
  void unregister<T extends Object>(T instance);
  T get<T extends Object>();
}
