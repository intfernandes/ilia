part of '../datasources.dart';


class TransactionsDatasource implements ITransactionDatasource {
  @override
  Future<TransactionEntity> create(
      {required UserEntity seller,
      required UserEntity customer,
      required ProductEntity product}) {
    throw UnimplementedError();
  }

  @override
  Future<TransactionEntity> getById({required int id}) {
    throw UnimplementedError();
  }
}
