// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_or_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateOrEditUserStore on CreateOrEditUserStoreBase, Store {
  late final _$usernameAtom =
      Atom(name: 'CreateOrEditUserStoreBase.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'CreateOrEditUserStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$birthDateAtom =
      Atom(name: 'CreateOrEditUserStoreBase.birthDate', context: context);

  @override
  String? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(String? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'CreateOrEditUserStoreBase.state', context: context);

  @override
  String? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$cityAtom =
      Atom(name: 'CreateOrEditUserStoreBase.city', context: context);

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$obsAtom =
      Atom(name: 'CreateOrEditUserStoreBase.obs', context: context);

  @override
  String? get obs {
    _$obsAtom.reportRead();
    return super.obs;
  }

  @override
  set obs(String? value) {
    _$obsAtom.reportWrite(value, super.obs, () {
      super.obs = value;
    });
  }

  late final _$setUsernameAsyncAction =
      AsyncAction('CreateOrEditUserStoreBase.setUsername', context: context);

  @override
  Future<void> setUsername(String? username) {
    return _$setUsernameAsyncAction.run(() => super.setUsername(username));
  }

  late final _$setEmailAsyncAction =
      AsyncAction('CreateOrEditUserStoreBase.setEmail', context: context);

  @override
  Future<void> setEmail(String? email) {
    return _$setEmailAsyncAction.run(() => super.setEmail(email));
  }

  late final _$setBirthdateAsyncAction =
      AsyncAction('CreateOrEditUserStoreBase.setBirthdate', context: context);

  @override
  Future<void> setBirthdate(String? birthDate) {
    return _$setBirthdateAsyncAction.run(() => super.setBirthdate(birthDate));
  }

  late final _$setStateAsyncAction =
      AsyncAction('CreateOrEditUserStoreBase.setState', context: context);

  @override
  Future<void> setState(String? state) {
    return _$setStateAsyncAction.run(() => super.setState(state));
  }

  late final _$setCityAsyncAction =
      AsyncAction('CreateOrEditUserStoreBase.setCity', context: context);

  @override
  Future<void> setCity(String? city) {
    return _$setCityAsyncAction.run(() => super.setCity(city));
  }

  late final _$setObsAsyncAction =
      AsyncAction('CreateOrEditUserStoreBase.setObs', context: context);

  @override
  Future<void> setObs(String? obs) {
    return _$setObsAsyncAction.run(() => super.setObs(obs));
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
birthDate: ${birthDate},
state: ${state},
city: ${city},
obs: ${obs}
    ''';
  }
}
