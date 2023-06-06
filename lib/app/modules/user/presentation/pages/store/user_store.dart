import 'package:eduqhub_test/app/modules/user/domain/usecase/get_users_usecase.dart';
import 'package:eduqhub_test/app/modules/user/presentation/pages/state/user_state.dart';
import 'package:mobx/mobx.dart';
import 'package:async/async.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final GetUsersUsecaseContract usecase;
  UserStoreBase({
    required this.usecase,
  });

  CancelableOperation? cancellableOperation;

  @observable
  UserState state = const StartUserState();

  @action
  Future<void> setState(UserState state) async => this.state = state;

  Future stateInitialReaction() async {
    final cancelOperation = cancellableOperation;
    cancellableOperation =
        CancelableOperation<UserState>.fromFuture(_listUser());
    await cancelOperation?.cancel();
    await setState(const LoadingUserState());
    await setState(await cancellableOperation!
        .valueOrCancellation(SucessUserState(users: state.users)));
    return;
  }

  Future<UserState> _listUser() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final result = await usecase();
    return result.fold((l) => ErrorUserState(error: l, users: []), (r) {
      return SucessUserState(users: r);
    });
  }
}
