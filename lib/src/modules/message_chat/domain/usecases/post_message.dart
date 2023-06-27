import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';

abstract class IPostMessage{
  Future<bool> call({
    required Message message,
    required String idChat
  });
}

class PostMessageImpl implements IPostMessage{

  final _storage = FirebaseFirestore.instance;

  @override
  Future<bool> call({
    required Message message,
    required String idChat
  }) async{
    try{
      await _storage.collection("chat").doc(idChat)
          .collection("messages").doc(message.id)
          .set(_getData(message));

      return true;
    }catch(e){
      return false;
    }
  }


  Map<String, dynamic> _getData(Message message){
    switch(message.type){
      case 0:
        return _mapSimpleMessage(message);
      case 1:
        return _mapSwapMessage(message);
      case 2:
        return _mapPlaceMessage(message);
    }

    return {};
  }

  Map<String, dynamic> _mapSimpleMessage(Message message){
    return {
      "id": message.id,
      "type": 0,
      "message": message.message,
      "idSender": message.idSender,
    };
  }

  Map<String, dynamic> _mapSwapMessage(Message message){
    return {};
  }

  Map<String, dynamic> _mapPlaceMessage(Message message){
    MessagePlace messagePlace = message as MessagePlace;
    return {
      "id": messagePlace.id,
      "type": 2,
      "message": messagePlace.message,
      "idSender": messagePlace.idSender,
      "date": messagePlace.date,
      "place": messagePlace.place,
      "status": messagePlace.status,
      "time": messagePlace.time
    };
  }

}