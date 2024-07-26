part of '../datasources.dart';

class ProductsDatasource implements IProductsDatasource {
  @override
  Future<TransactionEntity> create(
      {required UserEntity seller,
      required UserEntity customer,
      required ProductEntity product}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<TransactionEntity> getById({required int id}) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
