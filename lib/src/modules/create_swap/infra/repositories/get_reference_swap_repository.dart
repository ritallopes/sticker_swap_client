import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/repositories/interface_get_reference_swap_repository.dart';
import 'package:sticker_swap_client/src/modules/create_swap/external/config/create_swap_config.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/const/filter_modes_utils.dart';

class GetReferenceSwapRepository implements IGetReferenceSwapRepository {
  final IGetReferenceSwapDatasource _datasource;
  GetReferenceSwapRepository(this._datasource);

  @override
  Future<ReferenceSwap> getReference(
      {required String idSender, required String idOtherUser}) async {
    // pega os albuns dos usuários envolvidos nas trocas
    try {
      final map = await _datasource.getReference(
          idSender: idSender, idOtherUser: idOtherUser);

      // Pegar funçoes de filtragem
      final getRepeatedFunction =
          FilterModesUtils.filterFunction[FilterModesUtils.onlyRepeated];
      final getNeedFunction =
          FilterModesUtils.filterFunction[FilterModesUtils.onlyMissing];

      // aplica filtros
      final albumStickerRepeatedOtherUser =
          CreateSwapConfig.applyFliter(map[idOtherUser]!, getRepeatedFunction!);
      final albumStickerRepeatedSender =
          CreateSwapConfig.applyFliter(map[idSender]!, getRepeatedFunction);

      final albumStickerNeedOtherUser =
          CreateSwapConfig.applyFliter(map[idOtherUser]!, getNeedFunction!);
      final albumStickerNeedSender =
          CreateSwapConfig.applyFliter(map[idSender]!, getNeedFunction);

      return ReferenceSwap(
        stickersSender: _getStickerReferenceSwap(
            albumStickerNeedOtherUser, albumStickerRepeatedSender),
        stickersNeed: _getStickerReferenceSwap(
            albumStickerNeedSender, albumStickerRepeatedOtherUser),
      );
    } catch (e) {
      rethrow;
    }
  }

// compara albuns e retorna lista de figuras que usuário precisa que tem disponível no album do outro usuário e as que tenho disponível e o outro não tem
  Album _getStickerReferenceSwap(
      Album needStickerUser, Album repeatedStickerOtherUser) {
    Album albumView = Album();
    albumView.collectionStickers = {};

    List<Sticker> sticksGroup = [];

    for (int i = 0; i < 35; i++) {
      sticksGroup.clear();

      //Verifica se o grupo está presente nos dois albuns,
      //Caso não esteja, significa que não há figurinhas com match.
      if (needStickerUser.collectionStickers.containsKey(i) &&
          repeatedStickerOtherUser.collectionStickers.containsKey(i)) {
        //Percorre as figurinhas que o usuário precisa
        for (Sticker sticker
            in (needStickerUser.collectionStickers[i] as List<Sticker>)) {
          //Verifica se há figurinha correspondente a necessária no grupo
          //de repetidas do outro usuário, caso haja adicona.
          if (repeatedStickerOtherUser.collectionStickers[i]!
              .any((element) => element.text == sticker.text)) {
            sticksGroup.add(sticker);
          }
        }
      }

      if (sticksGroup.isNotEmpty) {
        albumView.collectionStickers[i] = List.from(sticksGroup);
      }
    }

    return albumView;
  }
}
