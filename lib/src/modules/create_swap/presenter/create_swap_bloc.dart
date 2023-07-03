import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/usecases/get_reference_swap.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class CreateSwapBloc {
  late String nameOtherUser;
  late ReferenceSwap referenceSwap;

  final user = Modular.get<User>();
  final _getReference = Modular.get<IGetReferenceSwap>();

  final _intexTelaStream = BehaviorSubject.seeded(0);
  Stream<int> get getIndexTela => _intexTelaStream.stream;

  Future<void> getReferenceSwap({Chat? chat, MessageSwapStickers? swap}) async {
    // verifica se a proposta é nova ou se está editando a proposta
    if (swap != null) {
      nameOtherUser = chat!.name;

      referenceSwap = ReferenceSwap(
          stickersSender: _generateCopyAlbumSwap(swap.stickersNeed),
          stickersNeed: _generateCopyAlbumSwap(swap.stickersSender),
      );
      mudarTela(2);
    } else if (chat != null) {
      // cria nova proposta preenchendo o
      final referenceSwap = await _getReference(
        idSender: user.id!,
        idOtherUser: chat.idUser,
      );
      nameOtherUser = chat.name;

      this.referenceSwap = referenceSwap;
      mudarTela(1);
    }
  }

  void mudarTela(int indexNovaTela) {
    _intexTelaStream.sink.add(indexNovaTela);
  }


  Album _generateCopyAlbumSwap(Album album){
    Album albumCopy = Album();
    albumCopy.collectionStickers = {};

    List<Sticker> sticksGroup = [];

    for (int i = 0; i < 35; i++) {
      sticksGroup.clear();

      if (album.collectionStickers.containsKey(i)) {
        for (Sticker sticker in (album.collectionStickers[i] as List<Sticker>)){
          sticksGroup.add(
            Sticker(
                id: sticker.id,
                text: sticker.text,
                idGroup: sticker.idGroup,
                quantity: sticker.quantity
            )
          );
        }
      }

      if (sticksGroup.isNotEmpty) {
        albumCopy.collectionStickers[i] = List.from(sticksGroup);
      }
    }

    return albumCopy;
  }


  void dispose() {
    _intexTelaStream.close();
  }
}
