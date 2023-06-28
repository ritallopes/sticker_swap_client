import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';

class MessageSwapStickersModel extends MessageSwapStickers{

  MessageSwapStickersModel({
    super.id,
    required super.idSender,
    required super.stickersNeed,
    required super.stickersSender,
    required super.status,
    super.type = 1,
    super.message = "Sujestão de troca",
  });

  factory MessageSwapStickersModel.fromMap(Map<String, dynamic> map) {
    return MessageSwapStickersModel(
      id: map['id'],
      status: map['status'],
      idSender: map['idSender'],
      stickersNeed: map['stickersNeed'],
      stickersSender: map['stickersSender'],
    );
  }

}