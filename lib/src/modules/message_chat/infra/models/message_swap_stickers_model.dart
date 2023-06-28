import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/infra/models/sticker_model.dart';

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
      stickersNeed: Album()..collectionStickers = _generateAlbum(map['stickerNeed']),
      stickersSender: Album()..collectionStickers = _generateAlbum(map['stickerSender']),
    );
  }

  static Map<int, List<Sticker>> _generateAlbum(Map<String, dynamic> data){
    Map<int, List<StickerModel>> collectionStickers = {
      for(int i=0; i <34; i++)
        if(data.containsKey(i.toString()))
          i: [
            for(final sticker in data[i.toString()] as List)
              StickerModel.fromMap(sticker)
          ]
    };
    return collectionStickers;
  }
}