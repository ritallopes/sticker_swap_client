import 'package:sticker_swap_client/src/core/entities/album.dart';

abstract class IGetReferenceSwapDatasource{
  Future<Map<String, Album>> getReference({
    required String idSender,
    required String idOtherUser
  });
}