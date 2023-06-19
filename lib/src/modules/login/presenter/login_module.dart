import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/login/domain/usecases/login.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_bloc.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_screen.dart';

class LoginModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<LoginBloc>((i) => LoginBloc()),
    Bind<ILogin>((i) => LoginImpl())
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const LoginScreen()),
  ];
}