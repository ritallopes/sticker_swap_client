import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/chat/presenter/widgets/search_chat.dart';
import 'package:sticker_swap_client/src/modules/search_user_chat/presenter/search_user_chat_bloc.dart';

class SearchUserChatScreen extends StatefulWidget {

  final List<Chat> chats;
  const SearchUserChatScreen({Key? key, required this.chats}) : super(key: key);

  @override
  State<SearchUserChatScreen> createState() => _SearchUserChatScreenState();
}

class _SearchUserChatScreenState extends ModularState<SearchUserChatScreen, SearchUserChatBloc> {

  @override
  void initState() {
    super.initState();
    controller.initScreen(widget.chats);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("Buscar colecionador", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchChat(
              onSearch: controller.onSearch,
              controller: controller.searchController
          ),

          StreamBuilder<bool>(
              initialData: false,
              stream: controller.isLoading,
              builder: (_, snapshot){
                if (snapshot.data!){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) =>
                        _userTile(controller.users[index]),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }


  Widget _userTile(User user){
    return InkWell(
      onTap: ()=> controller.createChat(user),

      child: Ink(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: user.image == null
                        ? null
                        : NetworkImage(user.image!),
                    maxRadius: 30,
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Ink(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(user.name!, style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 6,),
                          Text(
                            user.username!,
                            style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(Icons.add)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}