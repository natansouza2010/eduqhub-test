abstract class UserRemoteDatasourceContract {
  Future<List<dynamic>> getUsers();
  Future<Map<String, dynamic>> getUserById({required String id});
  Future<bool> updateUser({required Map<String, dynamic> userUpdateMap});
  Future<dynamic> saveUser({required Map<String, dynamic> userMap});
  Future<bool> deleteUserById({required String id});
}
