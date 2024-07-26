part of '../datasources.dart';

class TransactionsDatasource implements ITransactionsDatasource {
  @override
  Future<TransactionEntity> create(
      {required UserEntity seller,
      required UserEntity customer,
      required ProductEntity product}) async {
    return TransactionsModel();
  }

  @override
  Future<TransactionEntity> getById({required int id}) async {
    return TransactionsModel();
  }
}
