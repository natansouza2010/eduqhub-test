import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/create_or_edit_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateOrEditUserModule extends Module {
  @override
  List<Bind> get binds => [];

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
