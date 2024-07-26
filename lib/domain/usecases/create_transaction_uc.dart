import 'package:ilia/domain/entities/products/product_entity.dart';
import 'package:ilia/domain/entities/transactions/transaction_entity.dart';
import 'package:ilia/domain/entities/users/user_entity.dart';
import 'package:ilia/domain/repositories/i_tansactions_repository.dart';

class CreateTransactionUc {
  final ITransactionsRepository iTransactionsRepository;

  CreateTransactionUc({required this.iTransactionsRepository});

  Future<TransactionEntity> call({
    required UserEntity seller,
    required UserEntity customer,
    required ProductEntity product,
  }) async {
    return await iTransactionsRepository.create(
      seller: seller,
      customer: customer,
      product: product,
    );
  }
}
