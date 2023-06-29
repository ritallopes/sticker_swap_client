import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class CreateSwapConfig{

  static Album applyFliter(Album album, bool Function(Sticker) functionFilter){
    Album albumView = Album();

    albumView.collectionStickers = {};

    List<Sticker> sticksGroup = [];

    for(int i =0; i < 38; i++){
      sticksGroup.clear();

      if(album.collectionStickers.containsKey(i)){
        for(Sticker sticker in (album.collectionStickers[i] as List<Sticker>)) {
          if(functionFilter(sticker)) {
            sticksGroup.add(sticker);
          }
        }
      }

      if(sticksGroup.isNotEmpty) {
        albumView.collectionStickers[i] = List.from(sticksGroup);
      }
    }

    return albumView;
  }

}