import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

Album generateUniformAlbum(int qty) {
  Album album = Album();

  album.collectionStickers = {
    0: [
      for (int i = 1; i <= 7; i++)
        Sticker(id: i, text: "FWC $i", idGroup: 0, quantity: qty),
    ],
    1: [
      for (int i = 8; i <= 17; i++)
        Sticker(id: i, text: "FWC $i", idGroup: 1, quantity: qty),
    ],
    2: [
      Sticker(id: 18, text: "FWC 18", idGroup: 2, quantity: qty),
    ],
    for (int j = 3; j <= 34; j++)
      j: [
        for (int i = 1; i <= 20; i++)
          Sticker(id: i, text: "QAT $i", idGroup: j, quantity: qty),
      ],
  };

  return album;
}

Album generateEvenAlbum(int qty) {
  Album album = Album();

  album.collectionStickers = {
    0: [
      for (int i = 1; i <= 7; i++)
        Sticker(id: i, text: "FWC $i", idGroup: 0, quantity: (i + 1) % 2 + qty),
    ],
    1: [
      for (int i = 8; i <= 17; i++)
        Sticker(id: i, text: "FWC $i", idGroup: 1, quantity: (i + 1) % 2 + qty),
    ],
    2: [
      Sticker(id: 18, text: "FWC 18", idGroup: 2, quantity: 1 + qty),
    ],
    for (int j = 3; j <= 34; j++)
      j: [
        for (int i = 1; i <= 20; i++)
          Sticker(
              id: i, text: "QAT $i", idGroup: j, quantity: (i + 1) % 2 + qty),
      ],
  };

  return album;
}

Album generateOddAlbum(int qty) {
  Album album = Album();

  album.collectionStickers = {
    0: [
      for (int i = 1; i <= 7; i++)
        Sticker(id: i, text: "FWC $i", idGroup: 0, quantity: i % 2 + qty),
    ],
    1: [
      for (int i = 8; i <= 17; i++)
        Sticker(id: i, text: "FWC $i", idGroup: 1, quantity: i % 2 + qty),
    ],
    2: [
      Sticker(id: 18, text: "FWC 18", idGroup: 2, quantity: qty),
    ],
    for (int j = 3; j <= 34; j++)
      j: [
        for (int i = 1; i <= 20; i++)
          Sticker(id: i, text: "QAT $i", idGroup: j, quantity: i % 2 + qty),
      ],
  };

  return album;
}
