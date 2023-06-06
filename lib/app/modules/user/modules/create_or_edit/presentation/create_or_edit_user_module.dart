import 'package:eduqhub_test/app/modules/user/domain/usecase/save_user_usecase.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_contract.dart';
import 'package:eduqhub_test/app/modules/user/external/datasource/user_remote_datasource_impl.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_contract.dart';
import 'package:eduqhub_test/app/modules/user/infra/user_repository_impl.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/create_or_edit_user_page.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/store/create_or_edit_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateOrEditUserModule extends Module {
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

        //stores
        Bind.lazySingleton((i) => CreateOrEditUserStore(usecase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CreateOrEditUserPage(),
        ),
        ChildRoute(
          '/:id',
          child: (context, args) => CreateOrEditUserPage(id: args.params['id']),
        )
      ];
}
