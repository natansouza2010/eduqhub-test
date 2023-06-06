import 'package:asuka/asuka.dart';
import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/domain/usecase/save_user_usecase.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'create_or_edit_store.g.dart';

class CreateOrEditUserStore = CreateOrEditUserStoreBase
    with _$CreateOrEditUserStore;

abstract class CreateOrEditUserStoreBase with Store {
  final SaveUserUsecaseContract usecase;
  CreateOrEditUserStoreBase({
    required this.usecase,
  });

  @observable
  String? username;
  @observable
  String? email;
  @observable
  String? birthDate;
  @observable
  String? state;
  @observable
  String? city;
  @observable
  String? obs;

  @action
  Future<void> setUsername(String? username) async => this.username = username;
  @action
  Future<void> setEmail(String? email) async => this.email = email;
  @action
  Future<void> setBirthdate(String? birthDate) async =>
      this.birthDate = birthDate;
  @action
  Future<void> setState(String? state) async => this.state = state;
  @action
  Future<void> setCity(String? city) async => this.city = city;
  @action
  Future<void> setObs(String? obs) async => this.obs = obs;

  Future<void> createUser() async {
    if (validateField) {
      final date = DateFormat('yyyy-MM-DD').parse(_formatDate(birthDate!));
      User user = User(
        picture: '-',
        email: email!,
        firstName: username!,
        lastName: '',
        birthDate: date,
        state: state,
        city: city!,
        brief: obs!,
      );

      AsukaSnackbar.success("Usuário Gravado com Sucesso").show();
      print(user);
    }
  }

  bool get validateField {
    if (username != null &&
        email != null &&
        birthDate != null &&
        city != null &&
        obs != null) {
      return true;
    }
    return false;
  }

  bool validateEmail(String email) {
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return regex.hasMatch(email);
  }

  String _formatDate(String date) {
    List<String> parts = date.split('/');
    String day = parts[0];
    String month = parts[1];
    String year = parts[2];
    String formattedDate = '$year-$month-$day';
    return formattedDate;
  }
}
