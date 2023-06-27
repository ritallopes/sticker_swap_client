import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/settings/presenter/settings_bloc.dart';
import 'package:sticker_swap_client/src/modules/settings/presenter/settings_screen.dart';
import 'package:sticker_swap_client/src/modules/settings/domain/usecases/update_username.dart';

class SettingsModule extends WidgetModule{
  SettingsModule({super.key});

  @override
  List<Bind<Object>> get binds => [
    Bind<SettingsBloc>((i) => SettingsBloc()),
    Bind<IUpdateUsername>((i) => UpdateUsernameImpl())
  ];

  @override
  Widget get view => const SettingsScreen();

}
