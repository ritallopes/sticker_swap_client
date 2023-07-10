import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_module.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_module.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/get_messages.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/post_message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/update_message_status.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';

class MessageChatBloc {
  late Chat chat;
  final User _user = Modular.get<User>();
  final IGetMessages _getMessagesUseCase = Modular.get<IGetMessages>();
  final IPostMessage _postMessageUseCase = Modular.get<IPostMessage>();
  final _updateMessageStatusUseCase = Modular.get<IUpdateMessageStatus>();

  ScrollController listScrollController = ScrollController();


  late List<Message> messages;
  TextEditingController textController = TextEditingController();

  final BehaviorSubject<List<Message>> _messagesStream = BehaviorSubject();
  Stream<List<Message>> get getMessagesView => _messagesStream.stream;

  void getMessages(Chat chat) async {
    this.chat = chat;
    messages = await _getMessagesUseCase(idChat: chat.id, lastID: "");
    updateStreamMessage();
  }

  bool isMyMessage(Message message) => message.idSender == _user.id;

  //<! Funções de avliação de susgestão>
  void availableLocalization(
      {required MessagePlace messagePlace, required int newStatus}) async{
    if (messagePlace.status == StatusMessageConfirm.wait) {
      messagePlace.status = newStatus;
      await _updateMessageStatusUseCase(
          message: messagePlace,
          newStatus: newStatus,
          idChat: chat.id);
      updateStreamMessage();
    }
  }

  void availableSwap(
      {required MessageSwapStickers message, required int newStatus}) async{
    if (message.status == StatusMessageConfirm.wait) {
      message.status = newStatus;
      await _updateMessageStatusUseCase(
          message: message,
          newStatus: newStatus,
          idChat: chat.id);
      updateStreamMessage();
    }
  }


  ///Abertura de modal para editar troca
  void editSwap({required MessageSwapStickers message}) {
    swapSticker(messageSwap: message);
  }


  //<! Funções de envio de mensagens e susgestões>
  void sendMessage() async {
    if (textController.text.isNotEmpty) {
      final message =
          MessageSimple(message: textController.text, idSender: _user.id!);

      final sucesso =
          await _postMessageUseCase(message: message, idChat: chat.id);

      if (sucesso) {
        messages.add(message);
        textController.clear();
        updateStreamMessage();
      }
    }
  }

  void markLocation() async {
    await showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(12.0),
            topRight:  Radius.circular(12.0)
        )),
        isScrollControlled: true,
        backgroundColor: const Color(0xC7CACBD6),
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => MarkLocationModule(
              markLocation: updateMarkLocation,
            ));
  }

  void swapSticker({MessageSwapStickers? messageSwap}) async {
    await showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0))),
        backgroundColor: const Color(0xC7CACBD6),
        isScrollControlled: true,
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => CreateSwapModule(
          chat: chat,
          messageSwap: messageSwap,
          sendRefereceSwap: _sendRefereceSwap,
        ));
  }


  //<Funções auxilires para cadastro de mensagens>
  Future<void> updateMarkLocation(MessagePlace message) async {
    final sucesso =
        await _postMessageUseCase(message: message, idChat: chat.id);

    if (sucesso) {
      messages.add(message);
      _messagesStream.add(messages);
    }
  }

  void updateStreamMessage(){
    _messagesStream.sink.add(messages);
    Timer(const Duration(milliseconds: 100), (){
      if (listScrollController.hasClients) {
        final position = listScrollController.position.maxScrollExtent;
        listScrollController.jumpTo(position);
      }
    });
  }
  
  Future<void> _sendRefereceSwap(ReferenceSwap referenceSwap) async {
    final message = MessageSwapStickers(
      idSender: _user.id!,
      stickersNeed: referenceSwap.stickersNeed,
      stickersSender: referenceSwap.stickersSender,
      status: StatusMessageConfirm.wait,
    );

    final sucesso = await _postMessageUseCase(
        message: message,
        idChat: chat.id
    );

    if (sucesso) {
      messages.add(message);
      _messagesStream.add(messages);
    }
  }

  ///Dispose dos componentes
  void dispose() {
    textController.dispose();
    _messagesStream.close();
  }
}
