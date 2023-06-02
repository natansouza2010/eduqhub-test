import 'package:eduqhub_test/app/modules/user/presentation/pages/user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const UserPage(),
        )
      ];
}
