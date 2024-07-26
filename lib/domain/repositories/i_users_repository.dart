import 'package:ilia/domain/entities/users/user_entity.dart';

abstract class IUsersRepository {
  Future<UserEntity> getCurrentUser();
}
