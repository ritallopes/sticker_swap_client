import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/usecases/get_album.dart';

class GetReferenceSwapDatasource implements IGetReferenceSwapDatasource{

  final IGetAlbum _getAlbum = Modular.get<IGetAlbum>();

  @override
  Future<Map<String, Album>> getReference({
    required String idSender,
    required String idOtherUser
  })  async{
    try{
      Album albumSender = await _getAlbum(idUser: idSender);
      Album albumOtherUser = await _getAlbum(idUser: idOtherUser);

      return {
        idSender: albumSender,
        idOtherUser: albumOtherUser,
      };
    }catch(e){
      rethrow;
    }
  }

}
