import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';

abstract class IUpdateMessageStatus{
  Future<bool> call({
    required Message message,
    required int newStatus,
    required String idChat
  });
}

class UpdateMessageStatusImpl implements IUpdateMessageStatus{

  final _storage = FirebaseFirestore.instance;

  @override
  Future<bool> call({
    required Message message,
    required int newStatus,
    required String idChat
  }) async{
    try{
      await _storage.collection("chat").doc(idChat)
          .collection("messages").doc(message.id)
          .update({"status": newStatus});

      return true;
    }catch(e){
      return false;
    }
  }

}