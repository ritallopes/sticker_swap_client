import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class FilterUtils {
  static Album onlyObtained(Album originalAlbum) {
    Album filteredAlbum = Album();

    originalAlbum.collectionStickers.forEach((group, stickers) {
      List<Sticker> stickersGroup = [];

      for (var sticker in stickers) {
        if (sticker.quantity > 0) {
          stickersGroup.add(sticker);
        }
      }

      if (stickersGroup.isNotEmpty) {
        filteredAlbum.collectionStickers[group] = stickersGroup;
      }
    });

    return filteredAlbum;
  }

  static Album prepareAlbumToExchange(Album originalAlbum) {
    Album exchangeAlbum = Album();

    originalAlbum.collectionStickers.forEach((group, stickers) {
      List<Sticker> stickersGroup = [];

      for (var sticker in stickers) {
        if (sticker.quantity > 0) {
          sticker.quantity = 0;
          stickersGroup.add(sticker);
        }
      }

      if (stickersGroup.isNotEmpty) {
        exchangeAlbum.collectionStickers[group] = stickersGroup;
      }
    });

    return exchangeAlbum;
  }
}
