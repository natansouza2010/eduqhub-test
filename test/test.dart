import 'package:eduqhub_test/app/modules/user/external/datasource/city_remote_datasource_impl.dart';
import 'package:eduqhub_test/app/modules/user/infra/city_repository_impl.dart';

void main() {
  // UserRemoteDatasourceImpl impl = UserRemoteDatasourceImpl();
  // UserRepositoryImpl repository = UserRepositoryImpl(datasource: impl);

  CityRemoteDatasourceImpl impl = CityRemoteDatasourceImpl();
  CityRepositoryImpl repositoryImpl = CityRepositoryImpl(impl);

  void request() async {
    // final user = User(
    //     id: "1",
    //     birthDate: DateTime.now(),
    //     brief: "teste",
    //     city: "San charles",
    //     email: "natan@gmail",
    //     firstName: "Natan",
    //     lastName: "Souza",
    //     picture: "-",
    //     state: "CE");

    // final a = await repositoryImpl.getCity(state: "SP");
    // // final a = await repository.getUsers();
    // print(a);
  }

  request();
}
