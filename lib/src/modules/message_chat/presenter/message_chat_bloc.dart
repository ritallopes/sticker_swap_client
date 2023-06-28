import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_module.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_module.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/get_messages.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/post_message.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';

class MessageChatBloc{
  late String idChat;
  final User _user = Modular.get<User>();
  final IGetMessages _getMessagesUseCase = Modular.get<IGetMessages>();
  final IPostMessage _postMessageUseCase = Modular.get<IPostMessage>();

  late List<Message> messages;
  TextEditingController textController = TextEditingController();

  final BehaviorSubject<List<Message>> _messagesStream = BehaviorSubject();
  Stream<List<Message>> get getMessagesView => _messagesStream.stream;


  void getMessages(Chat chat) async{
    idChat = chat.id;
    messages = await _getMessagesUseCase(
        idChat: idChat,
        lastID: ""
    );
    _messagesStream.sink.add(messages);
  }

  bool isMyMessage(Message message)=> message.idSender == _user.id;


  void availableLocalization({
    required MessagePlace messagePlace,
    required int newStatus
  }){
    if(messagePlace.status == StatusMessageConfirm.wait){
      messagePlace.status = newStatus;
      _messagesStream.sink.add(messages);
    }
  }

  void availableSwap({
    required MessageSwapStickers message,
    required int newStatus
  }){
    if(message.status == StatusMessageConfirm.wait){
      message.status = newStatus;
      _messagesStream.sink.add(messages);
    }
  }

  void sendMessage() async{
    if(textController.text.isNotEmpty){
      final message = MessageSimple(
          message: textController.text,
          idSender: _user.id!
      );

      final sucesso = await _postMessageUseCase(message: message, idChat: idChat);

      if(sucesso){
        messages.add(message);
        textController.clear();
        _messagesStream.sink.add(messages);
      }
    }
  }

  void markLocation() async{
    await showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(12.0),
            topRight:  Radius.circular(12.0)
        )),
        backgroundColor: const Color(0xC7CACBD6),
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => MarkLocationModule(markLocation: updateMarkLocation,)
    );
  }

  void swapSticker() async{
    _postMessageUseCase(
        message: MessageSwapStickers(
            idSender: _user.id!,
            stickersNeed: Album()..collectionStickers = {
              0 : [
                Sticker(id: 1, text: "AUS 1", idGroup: 0, quantity: 1),
              ],
              2 : [
                Sticker(id: 2, text: "BRA 1", idGroup: 2, quantity: 0),
              ]
            },
            stickersSender: Album()..collectionStickers = {
              2 : [
                Sticker(id: 1, text: "BRA 13", idGroup: 2, quantity: 1),
                Sticker(id: 2, text: "BRA 19", idGroup: 2, quantity: 0),
              ]
            },
            status: StatusMessageConfirm.wait
        ),
        idChat: idChat);
    return;

    await showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(12.0),
            topRight:  Radius.circular(12.0)
        )),
        backgroundColor: Color(0xC7CACBD6),
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => CreateSwapModule()
    );
  }

  Future<void> updateMarkLocation(MessagePlace message) async{
    final sucesso = await _postMessageUseCase(message: message, idChat: idChat);

    if(sucesso){
      messages.add(message);
      _messagesStream.add(messages);
    }
  }

  void dispose(){
    textController.dispose();
    _messagesStream.close();
  }
  
}