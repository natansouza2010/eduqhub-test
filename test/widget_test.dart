import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_impl.dart';

void main() {
  UserRemoteDatasourceImpl impl = UserRemoteDatasourceImpl();

  void request() async {
    impl.getUsers();
  }

  request();
}
