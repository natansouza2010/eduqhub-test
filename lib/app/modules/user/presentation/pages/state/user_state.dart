import 'package:eduqhub_test/app/modules/user/domain/model/user.dart';

abstract class UserState {
  final List<User> users;
  const UserState({
    required this.users,
  });
}

class StartUserState extends UserState {
  const StartUserState({super.users = const []});
}

class LoadingUserState extends UserState {
  const LoadingUserState({super.users = const []});
}

class LoadedUserState extends UserState {
  const LoadedUserState({required super.users});
}

class ErrorUserState extends UserState {
  final Error error;
  const ErrorUserState({required this.error, required super.users});
}

class SucessUserState extends UserState {
  const SucessUserState({required super.users});
}
