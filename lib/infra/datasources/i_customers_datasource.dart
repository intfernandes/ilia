
import 'package:ilia/domain/entities/products/product_entity.dart';
import 'package:ilia/domain/entities/transactions/transaction_entity.dart';
import 'package:ilia/domain/entities/users/user_entity.dart';

abstract class ICustomersDatasource {
  Future<TransactionEntity> getById({
    required int id,
  });

  Future<TransactionEntity> create({
    required UserEntity seller,
    required UserEntity customer,
    required ProductEntity product,
  });
}
