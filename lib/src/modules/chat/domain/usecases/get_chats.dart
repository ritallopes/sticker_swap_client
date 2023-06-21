import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';

abstract class IGetChats{
  Future<List<Chat>> call({required String idUser});
}

class GetChatsImpl implements IGetChats{

  final _firebase = FirebaseFirestore.instance;

  @override
  Future<List<Chat>> call({required String idUser}) async{
    try{
      List<Chat> chats = <Chat>[];
      final result = await _firebase.collection("chat")
          .where("users", arrayContains: idUser)
          .get();

      for(final doc in result.docs){
        late Map<String, dynamic> map;

        if(doc.data()["u1"]["id"]==idUser){
          map = doc.data()["u2"];
        }else{
          map = doc.data()["u1"];
        }

        chats.add(Chat(
            id: doc.id,
            name: map["name"],
            image: map["image"],
            username: map["username"])
        );
      }

      return chats;
    }catch(e){
      rethrow;
    }
  }

}