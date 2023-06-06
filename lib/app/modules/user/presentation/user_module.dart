import 'package:eduqhub_test/app/modules/user/domain/usecase/get_users_usecase.dart';
import 'package:eduqhub_test/app/modules/user/domain/usecase/save_user_usecase.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_impl.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_contract.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_impl.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/create_or_edit_user_module.dart';
import 'package:eduqhub_test/app/modules/user/presentation/pages/store/user_store.dart';
import 'package:eduqhub_test/app/modules/user/presentation/pages/user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../external/datasource/user_remote_datasource_contract.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        //Datasource
        Bind.factory<UserRemoteDatasourceContract>(
            (i) => UserRemoteDatasourceImpl()),
        //Repository
        Bind.factory<UserRepositoryContract>(
            (i) => UserRepositoryImpl(datasource: i())),
        //Usecases
        Bind.factory<SaveUserUsecaseContract>(
            (i) => SaveUserUsecase(repository: i())),
        Bind.factory<GetUsersUsecaseContract>(
            (i) => GetUserUsecase(repository: i())),
        //stores
        Bind.lazySingleton((i) => UserStore(usecase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const UserPage(),
        ),
        ModuleRoute('/save', module: CreateOrEditUserModule()),
        ModuleRoute('/edit', module: CreateOrEditUserModule())
      ];
}
