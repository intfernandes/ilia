library datasources;

import 'package:ilia/domain/entities/products/product_entity.dart';
import 'package:ilia/domain/entities/transactions/transaction_entity.dart';
import 'package:ilia/domain/entities/users/user_entity.dart';
import 'package:ilia/infra/datasources/i_customers_datasource.dart';
import 'package:ilia/infra/datasources/i_products_datasource.dart';
import 'package:ilia/infra/datasources/i_transactions_datasource.dart';
import 'package:ilia/infra/models/transactions_model.dart';

part 'package:ilia/external/datasources/customers/customers_datasource.dart';
part 'package:ilia/external/datasources/products/products_datasource.dart';
part 'package:ilia/external/datasources/transactions/transactions_datasource.dart';
