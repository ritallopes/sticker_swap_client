import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_simple_model.dart';


abstract class IPostMessage{
  Future<bool> call({
    required MessageSimpleModel message,
    required String idChat
  });
}

class GetMessagesImpl implements IPostMessage{

  final _storage = FirebaseFirestore.instance;


  @override
  Future<bool> call({
    required MessageSimpleModel message,
    required String idChat
  }) async{
    try{
      await _storage.collection("chat").doc(idChat)
          .collection("messages").doc(message.id)
          .set(message.toMap());

      return true;
    }catch(e){
      return false;
    }
  }

}