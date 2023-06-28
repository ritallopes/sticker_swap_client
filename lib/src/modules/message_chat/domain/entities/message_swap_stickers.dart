import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageSwapStickers extends Message{

  int status;
  Album stickersNeed;
  Album stickersSender;

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