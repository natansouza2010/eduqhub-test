import 'package:eduqhub_test/app/modules/user/presentation/user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute('/', to: '/user/'),
        ModuleRoute('/user/', module: UserModule()),
      ];
}
