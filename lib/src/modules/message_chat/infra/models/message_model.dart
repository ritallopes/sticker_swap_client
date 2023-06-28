import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel(
      {required super.id,
      required super.type,
      required super.message,
      required super.idSender});

}
