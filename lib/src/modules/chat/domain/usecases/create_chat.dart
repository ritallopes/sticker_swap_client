import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';

abstract class ICreateChat{
  Future<Chat?> call({required User user, required User otherUser});
}

class CreateChatImpl implements ICreateChat{

  final _firebase = FirebaseFirestore.instance;

  @override
  Future<Chat?> call({required User user, required User otherUser}) async{
    try{
      late Chat newChat;

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
      }).then((document){
        newChat = Chat(
            id: document.id,
            name: otherUser.name!,
            idUser: otherUser.id!,
            image: otherUser.image,
            username: otherUser.username!,
        );
        return document;
      });

      return newChat;
    }catch(e){
      return null;
    }
  }

}