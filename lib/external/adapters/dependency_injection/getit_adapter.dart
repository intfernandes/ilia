part of '../adapters.dart';

class GetItImpl implements IInjector {
  GetItImpl() {
    register();
  }

  @override
  add<T extends Object>(constructor) {
    GetIt.I.registerFactory<T>(() => constructor);
  }

  @override
  addSingleton<T extends Object>(constructor) {
    GetIt.I.registerLazySingleton<T>(constructor());
  }

  @override
  T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  @override
  void register() {
    
    add<ITransactionsDatasource>(TransactionsDatasource());

    add<ITransactionsRepository>(TransactionsRepository(
        datasource: GetIt.I.get<ITransactionsDatasource>()));

    add<CreateTransactionUc>(CreateTransactionUc(
        iTransactionsRepository: GetIt.I.get<ITransactionsRepository>()));
  }
}
