import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_impl.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_impl.dart';

void main() {
  UserRemoteDatasourceImpl impl = UserRemoteDatasourceImpl();
  UserRepositoryImpl repository = UserRepositoryImpl(datasource: impl);

  void request() async {
    final user = User(
        id: "1",
        birthDate: DateTime.now(),
        brief: "teste",
        city: "San charles",
        email: "natan@gmail",
        firstName: "Natan",
        lastName: "Souza",
        picture: "-",
        state: "CE");

    final a = await repository.saveUser(user: user);
    // final a = await repository.getUsers();
    print(a);
  }

  request();
}
