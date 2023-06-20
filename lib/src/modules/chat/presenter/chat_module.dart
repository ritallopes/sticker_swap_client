import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/get_chats.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/get_users_by_username.dart';
import 'package:sticker_swap_client/src/modules/chat/presenter/chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/chat/presenter/chat_screen.dart';

class ChatModule extends WidgetModule{
  @override
  List<Bind<Object>> get binds => [
    Bind<ChatBloc>((i)=> ChatBloc()),

    Bind<IGetChats>((i) => GetChatsImpl()),
    Bind<ICreateChat>((i) => CreateChatImpl()),
    Bind<IGetUsersByUsername>((i) => GetUsersByUsernameImpl())
  ];

  @override
  Widget get view => const ChatScreen();

}