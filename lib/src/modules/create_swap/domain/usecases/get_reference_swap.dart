import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/repositories/interface_get_reference_swap_repository.dart';

abstract class IGetReferenceSwap{
  Future<ReferenceSwap> call({
    required String idSender,
    required String idOtherUser
  });
}

class GetReferenceSwap implements IGetReferenceSwap{

  final IGetReferenceSwapRepository _repository;
  GetReferenceSwap(this._repository);

  @override
  Future<ReferenceSwap> call({
    required String idSender,
    required String idOtherUser
  }) async{
    try{
      return await _repository.getReference(
          idSender: idSender,
          idOtherUser: idOtherUser
      );
    }catch(e){
      rethrow;
    }
  }

}