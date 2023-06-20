import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

abstract class ICreateChat{
  Future<bool> call({required User user, required User otherUser});
}

class CreateChatImpl implements ICreateChat{

  final _firebase = FirebaseFirestore.instance;

  @override
  Future<bool> call({required User user, required User otherUser}) async{
    try{
      await _firebase.collection("chat").add({
        "users" : [user.id, otherUser.id],
        "u1": {
          "id": user.id,
          "name": user.name,
          "image": user.image,
          "email": user.email,
          "username": user.username,
        },
        "u2": {
          "id": otherUser.id,
          "name": otherUser.name,
          "image": otherUser.image,
          "email": otherUser.email,
          "username": otherUser.username,
        }
      });

      return true;
    }catch(e){
      return false;
    }
  }

}