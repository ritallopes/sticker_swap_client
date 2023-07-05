import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/suggestion_swap_type.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_suggestion/create_swap_suggestion_bloc.dart';

import '../../util/filter_album.dart';
import '../../util/generate_base_album.dart';

void main() {
  test('Testar se configuração é respeitada, caso random', () async {
    // initial data
    Album stickersNeed =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));
    Album stickersSender =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));

    ReferenceSwap referenceSwap = ReferenceSwap(
        stickersNeed: stickersNeed, stickersSender: stickersSender);

    var createSwapSuggestionBloc = CreateSwapSuggestionBloc(
      referenceSwap: referenceSwap,
      nameOtherUser: "nameOtherUser",
      proximaTela: (int) {
        return 2;
      },
    );

    createSwapSuggestionBloc.suggestionType = SuggestionSwapType.random;
    createSwapSuggestionBloc.maxReceivedStickers =
        TextEditingController(text: '5');
    createSwapSuggestionBloc.maxTradedStickers =
        TextEditingController(text: '4');

    // result
    int countAllNeeded = _countStickers(referenceSwap.stickersNeed);
    int countAllSend = _countStickers(referenceSwap.stickersNeed);

    expect(false, referenceSwap.stickersNeed.collectionStickers.isEmpty);
    expect(false, referenceSwap.stickersSender.collectionStickers.isEmpty);
    expect(0, countAllNeeded);
    expect(0, countAllSend);

    createSwapSuggestionBloc.generateSuggestion();

    int countNeeded = _countStickers(referenceSwap.stickersNeed);
    int countSend = _countStickers(referenceSwap.stickersSender);

    expect(true, countNeeded <= 5);
    expect(true, countNeeded > 0);
    expect(true, countSend <= 4);
    expect(true, countSend > 0);
  });

  test('Testar se configuração é respeitada, caso especial', () async {
    // initial data
    Album stickersNeed =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));
    Album stickersSender =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));

    ReferenceSwap referenceSwap = ReferenceSwap(
        stickersNeed: stickersNeed, stickersSender: stickersSender);

    var createSwapSuggestionBloc = CreateSwapSuggestionBloc(
      referenceSwap: referenceSwap,
      nameOtherUser: "nameOtherUser",
      proximaTela: (int) {
        return 2;
      },
    );

    createSwapSuggestionBloc.suggestionType = SuggestionSwapType.special;
    createSwapSuggestionBloc.maxReceivedStickers =
        TextEditingController(text: '5');
    createSwapSuggestionBloc.maxTradedStickers =
        TextEditingController(text: '4');

    // result
    int countAllNeeded = _countStickers(referenceSwap.stickersNeed);
    int countAllSend = _countStickers(referenceSwap.stickersNeed);

    expect(false, referenceSwap.stickersNeed.collectionStickers.isEmpty);
    expect(false, referenceSwap.stickersSender.collectionStickers.isEmpty);
    expect(0, countAllNeeded);
    expect(0, countAllSend);

    createSwapSuggestionBloc.generateSuggestion();

    int countNeeded = _countStickers(referenceSwap.stickersNeed);
    int countNeededSpecial =
        _countStickersFromGroup(referenceSwap.stickersNeed, 0);

    int countSend = _countStickers(referenceSwap.stickersSender);
    int countSendSpecial =
        _countStickersFromGroup(referenceSwap.stickersSender, 0);

    expect(true, countNeeded <= 5);
    expect(true, countNeeded > 0);
    expect(true, countNeeded == countNeededSpecial);

    expect(true, countSend <= 4);
    expect(true, countSend > 0);
    expect(true, countSend == countSendSpecial);
  });

  test('Testar se configuração é respeitada, caso comuns', () async {
    // initial data
    Album stickersNeed =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));
    Album stickersSender =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));

    ReferenceSwap referenceSwap = ReferenceSwap(
        stickersNeed: stickersNeed, stickersSender: stickersSender);

    var createSwapSuggestionBloc = CreateSwapSuggestionBloc(
      referenceSwap: referenceSwap,
      nameOtherUser: "nameOtherUser",
      proximaTela: (int) {
        return 2;
      },
    );

    createSwapSuggestionBloc.suggestionType = SuggestionSwapType.standard;
    createSwapSuggestionBloc.maxReceivedStickers =
        TextEditingController(text: '5');
    createSwapSuggestionBloc.maxTradedStickers =
        TextEditingController(text: '4');

    // result
    int countAllNeeded = _countStickers(referenceSwap.stickersNeed);
    int countAllSend = _countStickers(referenceSwap.stickersNeed);

    expect(false, referenceSwap.stickersNeed.collectionStickers.isEmpty);
    expect(false, referenceSwap.stickersSender.collectionStickers.isEmpty);
    expect(0, countAllNeeded);
    expect(0, countAllSend);

    createSwapSuggestionBloc.generateSuggestion();

    int countNeeded = _countStickers(referenceSwap.stickersNeed);
    int countNeededSpecial =
        _countStickersFromGroup(referenceSwap.stickersNeed, 0);

    int countSend = _countStickers(referenceSwap.stickersSender);
    int countSendSpecial =
        _countStickersFromGroup(referenceSwap.stickersSender, 0);

    expect(true, countNeeded <= 5);
    expect(true, countNeeded > 0);
    expect(true, countNeededSpecial == 0);

    expect(true, countSend <= 4);
    expect(true, countSend > 0);
    expect(true, countSendSpecial == 0);
  });
}

int _countStickers(Album album) {
  var countSuggestion = 0;
  album.collectionStickers.forEach((group, stickers) {
    for (var s in stickers) {
      if (s.quantity > 0) {
        countSuggestion++;
      }
    }
  });
  return countSuggestion;
}

int _countStickersFromGroup(Album album, int g) {
  var countSuggestion = 0;
  album.collectionStickers.forEach((group, stickers) {
    if (g == group) {
      for (var s in stickers) {
        if (s.quantity > 0) {
          countSuggestion++;
        }
      }
    }
  });
  return countSuggestion;
}
