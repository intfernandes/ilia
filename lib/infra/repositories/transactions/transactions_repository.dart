part of '../repositories.dart';

class TransactionsRepository implements ITransactionsRepository {
  final ITransactionDatasource _datasource;

  TransactionsRepository({required ITransactionDatasource datasource})
      : _datasource = datasource;

  @override
  Future<TransactionEntity> create(
      {required UserEntity seller,
      required UserEntity customer,
      required ProductEntity product}) async {
    try {
      return _datasource.create(
          seller: seller, customer: customer, product: product);
    } on ServerException {
      throw Exception(
          'TransactionsRepository: ServerException on method create');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransactionEntity> getById({required int id}) async {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
