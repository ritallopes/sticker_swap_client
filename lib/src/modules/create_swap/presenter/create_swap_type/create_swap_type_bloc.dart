import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';

class CreateSwapTypeBloc {
  Function(int) proximaTela;
  String nameOtherUser;
  ReferenceSwap referenceSwap;
  CreateSwapTypeBloc({
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });

  Future<void> orgSwap() async {
    proximaTela(2);
  }

  Future<void> orgSuggestionSwap() async {
    proximaTela(3);
  }

  int get quantNeedSticker => _countStickersAlbum(referenceSwap.stickersNeed);
  int get quantSendSticker => _countStickersAlbum(referenceSwap.stickersSender);

  int _countStickersAlbum(Album album){
    int count =0;
    for(int i =0; i < 35; i++){
      if(album.collectionStickers.containsKey(i)){
        count+=album.collectionStickers[i]!.length;
      }
    }
    return count;
  }
}