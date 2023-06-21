import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';

class ChatTile extends StatelessWidget {

  final Chat chat;
  final Function(Chat chat) onTap;

  const ChatTile({
    required this.chat,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(chat),

      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: chat.image == null
                        ? null
                        : NetworkImage(chat.image!),
                    maxRadius: 30,
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Ink(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(chat.name, style: TextStyle(fontSize: 16),),
                          const SizedBox(height: 6,),
                          Text(
                            chat.username,
                            style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
