import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class MessageSwapStickers extends Message{

  int status;
  List<Sticker> stickersNeed;
  List<Sticker> stickersSender;

  MessageSwapStickers({
    super.id,
    required super.idSender,
    required this.stickersNeed,
    required this.stickersSender,
    required this.status,
    super.type = 1,
    super.message = "Sujestão de troca",
  });


}