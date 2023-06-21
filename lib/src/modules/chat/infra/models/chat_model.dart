import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';

class ChatModel extends Chat {
  ChatModel({
      required super.id,
      required super.name,
      required super.image,
      required super.username
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      username: map['username'],
    );
  }

  static List<ChatModel> listFromJson(List<dynamic> json) {
    return (json)
        .map((e) => ChatModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
