import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/core/entities/auth.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

import '../../infra/models/sticker_model.dart';

abstract class IGetAlbum{

  Future<Album> call({required User user, required  Auth auth});

}

  
class GetAlbumImpl extends IGetAlbum{
  @override
  Future<Album> call({required User user, required  Auth auth}) async{
    Album album = Album();

    Map<int, List<StickerModel>> collectionStickers = Map();

    return album;
  }
}