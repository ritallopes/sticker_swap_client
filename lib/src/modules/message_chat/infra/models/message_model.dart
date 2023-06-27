import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_place_model.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_simple_model.dart';

class MessageModel extends Message {
  MessageModel(
      {required super.id,
      required super.type,
      required super.message,
      required super.idSender});

}
