part of '../adapters.dart';

class AutoInjectorImpl implements IInjector {
  AutoInjectorImpl() {
    register();
  }

  final _autoInjector = AutoInjector();

  @override
  add<T extends Object>(constructor) {
    _autoInjector.add<T>(constructor);
  }

  @override
  addSingleton<T extends Object>(constructor) {
    _autoInjector.addSingleton<T>(constructor);
  }

  @override
  T get<T extends Object>() {
    return _autoInjector.get<T>();
  }

  @override
  void register() {
    add<ITransactionsDatasource>(TransactionsDatasource.new);
    add<ITransactionsRepository>(TransactionsRepository.new);
    add<CreateTransactionUc>(CreateTransactionUc.new);
    _autoInjector.commit();
  }
}
