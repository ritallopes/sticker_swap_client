import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_client/src/modules/search_user_chat/domain/usecases/get_users_by_username.dart';
import 'package:sticker_swap_client/src/modules/search_user_chat/presenter/search_user_chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/search_user_chat/presenter/search_user_chat_screen.dart';

class SearchUserChatModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    Bind<SearchUserChatBloc>((i)=> SearchUserChatBloc()),

    Bind<ICreateChat>((i) => CreateChatImpl()),
    Bind<IGetUsersByUsername>((i) => GetUsersByUsernameImpl())
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => SearchUserChatScreen()),
  ];

}