import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';

abstract class UserRepositoryContract {
  Future<List<User>> getUsers();
  Future<User> getUserById({required String id});
  Future<bool> updateUser({required User user});
  Future<String> saveUser({required User user});
  Future<bool> deleteUserById({required String id});
}
