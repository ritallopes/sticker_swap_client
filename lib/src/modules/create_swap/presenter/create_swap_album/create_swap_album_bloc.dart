import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';

import '../../../../core/entities/user.dart';
import '../../../message_chat/domain/usecases/post_message.dart';

class CreateSwapAlbumBloc {
  final String nameOtherUser;
  final ReferenceSwap referenceSwap;
  final String idChat;

  final User _user = Modular.get<User>();
  final IPostMessage _postMessageUseCase = Modular.get<IPostMessage>();

  CreateSwapAlbumBloc({
    required this.referenceSwap,
    required this.nameOtherUser,
    required this.idChat,
  });

  final _stickersStream = BehaviorSubject.seeded(true);
  Stream<bool> get getSwap => _stickersStream.stream;

  void chageStatusSticker(Sticker sticker) {
    sticker.quantity = (sticker.quantity + 1) % 2;
    _stickersStream.sink.add(true);
  }

  void dispose() {
    _stickersStream.close();
  }

  void sendRefereceSwap() async {
    final message = MessageSwapStickers(
      idSender: _user.id!,
      stickersNeed: referenceSwap.stickersNeed,
      stickersSender: referenceSwap.stickersSender,
      status: StatusMessageConfirm.wait,
    );

    final sucesso = await _postMessageUseCase(message: message, idChat: idChat);
  }
}
