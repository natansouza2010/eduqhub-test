import 'package:asuka/asuka.dart';
import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';
import 'package:eduqhub_test/app/modules/user/domain/usecase/get_citys_usecase.dart';
import 'package:eduqhub_test/app/modules/user/domain/usecase/save_user_usecase.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/state/city_state.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:async/async.dart';

part 'create_or_edit_store.g.dart';

class CreateOrEditUserStore = CreateOrEditUserStoreBase
    with _$CreateOrEditUserStore;

abstract class CreateOrEditUserStoreBase with Store {
  final SaveUserUsecaseContract usecase;
  final GetCitysUsecaseContract usecaseCity;
  CancelableOperation? cancellableOperation;
  CreateOrEditUserStoreBase({
    required this.usecase,
    required this.usecaseCity,
  }) {
    reaction((_) => state, (_) async {
      city = "";

      await stateInitialReaction(uf: state ?? "");
    });
  }

  @observable
  CityState cityState = const StartCityState();

  @action
  Future<void> setCityState(CityState cityState) async =>
      this.cityState = cityState;

  Future stateInitialReaction({required String uf}) async {
    final cancelOperation = cancellableOperation;
    cancellableOperation =
        CancelableOperation<CityState>.fromFuture(_listCity(uf: uf));
    await cancelOperation?.cancel();
    await setCityState(const LoadingCityState());
    await setCityState(await cancellableOperation!
        .valueOrCancellation(SucessCityState(city: cityState.city)));
    return;
  }

  Future<CityState> _listCity({required String uf}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final result = await usecaseCity(uf: uf);
    return result.fold((l) => ErrorCityState(error: l, city: []), (r) {
      return SucessCityState(city: r);
    });
  }

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
      await usecase.call(user: user);
      AsukaSnackbar.success("Usuário Gravado com Sucesso").show();
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
