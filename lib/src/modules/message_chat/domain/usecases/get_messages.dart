import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

abstract class IGetMessages{
  Future<List<Message>> call({required String idChat});
}

class GetMessagesImpl implements IGetMessages{

  @override
  Future<List<Message>> call({required String idChat}) async{
    return <Message>[];
  }

}