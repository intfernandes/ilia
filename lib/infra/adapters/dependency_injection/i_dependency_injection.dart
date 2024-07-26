abstract class IInjector {
  void add<T extends Object>(constructor);
  void addSingleton<T extends Object>(constructor);
  void register();
  T get<T extends Object>();
}
