import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/get_messages.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/post_message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_screen.dart';

class MessageChatModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<MessageChatBloc>((i)=> MessageChatBloc()),

    Bind<IGetMessages>((i)=> GetMessagesImpl()),
    Bind<IPostMessage>((i)=> PostMessageImpl()),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => MessageChatScreen(chat: args.data,)),
  ];
}