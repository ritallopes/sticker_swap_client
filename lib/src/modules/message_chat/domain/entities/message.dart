class Message{

  String id;
  int type;
  String idSender;
  String message;

  Message({
    String? id,
    required this.type,
    required this.message,
    required this.idSender
  }) : id = id ?? "${DateTime.now().millisecondsSinceEpoch}$idSender";

}