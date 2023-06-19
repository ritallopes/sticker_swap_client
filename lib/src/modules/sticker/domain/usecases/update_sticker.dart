import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

abstract class IUpdateSticker{

  Future<bool> call({required User user, required Sticker sticker});

}


class UpdateStickerImpl extends IUpdateSticker{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<bool> call({required User user, required Sticker sticker}) async{
    try{
      await firestore.collection("album").doc(user.id).update({
        sticker.text : {
          "id": sticker.id,
          "text": sticker.text,
          "idGroup": sticker.idGroup,
          "quantity": sticker.quantity,
        }
      });
      return true;
    }catch(e){
      return false;
    }
  }
}