import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';

abstract class IGetReferenceSwapRepository{
  Future<ReferenceSwap> getReference({
    required String idSender,
    required String idOtherUser
  });
}