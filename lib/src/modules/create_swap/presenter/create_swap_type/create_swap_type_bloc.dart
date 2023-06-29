import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/usecases/get_reference_swap.dart';

class CreateSwapTypeBloc {

  Function(int) proximaTela;
  String idUser, idOtherUser;
  ReferenceSwap referenceSwap;
  CreateSwapTypeBloc({
    required this.referenceSwap,
    required this.proximaTela,
    required this.idOtherUser,
    required this.idUser
  });

  final _getReference = Modular.get<IGetReferenceSwap>();

  Future<void> orgSwap() async{
    final referenceSwap = await _getReference(
        idSender: idUser,
        idOtherUser: idOtherUser
    );

    this.referenceSwap.stickersSender = referenceSwap.stickersSender;
    this.referenceSwap.stickersNeed = referenceSwap.stickersNeed;
    proximaTela(1);
  }

}
