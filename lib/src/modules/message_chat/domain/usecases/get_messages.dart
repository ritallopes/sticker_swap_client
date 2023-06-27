import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_place_model.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_simple_model.dart';

abstract class IGetMessages{
  Future<List<Message>> call({
    required String idChat,
    required String lastID,
  });
}

class GetMessagesImpl implements IGetMessages{

  final _storage = FirebaseFirestore.instance;

  @override
  Future<List<Message>> call({
    required String idChat,
    required String lastID,
  }) async{
    try{
      List<Message> messages = <Message>[];

      final result = await _storage
          .collection("chat")
          .doc(idChat)
          .collection("messages")
          .where("id", isGreaterThan: lastID)
          .get();

      for(final doc in result.docs){
        messages.add(_messageFromMap(doc.data()));
      }

      return messages;
    }catch(e){
      rethrow;
    }
  }

  Message _messageFromMap(Map<String, dynamic> map) {
    if(map['type'] == 1) {
      //Adicionar swap message
    }
    if(map['type'] == 2) {
      return MessagePlaceModel.fromMap(map);
    }

    return MessageSimpleModel.fromMap(map);
  }

}