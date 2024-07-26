library repositories;

import 'package:ilia/domain/entities/products/product_entity.dart';
import 'package:ilia/domain/entities/transactions/transaction_entity.dart';
import 'package:ilia/domain/entities/users/user_entity.dart';
import 'package:ilia/domain/repositories/i_customers_repository.dart';
import 'package:ilia/domain/repositories/i_products_repository.dart';
import 'package:ilia/domain/repositories/i_tansactions_repository.dart';
import 'package:ilia/infra/datasources/i_transactions_datasource.dart';
import 'package:ilia/infra/exceptions/exceptions.dart';

part 'package:ilia/infra/repositories/customers/customers_repository.dart';
part 'package:ilia/infra/repositories/products/products_repository.dart';
part 'package:ilia/infra/repositories/transactions/transactions_repository.dart';
