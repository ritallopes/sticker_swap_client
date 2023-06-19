import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/register/domain/usecases/register_user.dart';
import 'package:sticker_swap_client/src/modules/register/presenter/register_bloc.dart';
import 'package:sticker_swap_client/src/modules/register/presenter/register_screen.dart';

class RegisterModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<RegisterBloc>((i) => RegisterBloc()),
    Bind<IRegisterUser>((i) => RegisterUserImpl()),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const RegisterScreen()),
  ];
}