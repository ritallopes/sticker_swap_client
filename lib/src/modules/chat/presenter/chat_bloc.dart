import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/get_chats.dart';
import 'package:sticker_swap_client/src/modules/login/domain/usecases/get_user.dart';

class ChatBloc{

  final _user = Modular.get<User>();
  final _getUserUseCase = Modular.get<IGetUser>();
  final _getChatsUseCase = Modular.get<IGetChats>();
  final _createChatUseCase = Modular.get<ICreateChat>();

  late List<Chat> chats;
  TextEditingController searchController = TextEditingController();

  final BehaviorSubject<List<Chat>> _chatsStream = BehaviorSubject();
  Stream<List<Chat>> get getChatsView => _chatsStream.stream;


  Future<void> getChats() async{
    try{
      chats = await _getChatsUseCase.call(idUser: _user.id!);
      _chatsStream.sink.add(chats);
    }catch(e){
      _chatsStream.sink.addError(e);
    }
  }

  void openScanQrCode() async{
    try{
      String result = await FlutterBarcodeScanner.scanBarcode(
        "#eb3434",
        "Cancelar",
        true,
        ScanMode.QR
      );

      //Verificar se informacao foi recebida
      if(result != "-1") _getUserByIDAndCreateChat(idUser: result);
    }catch(e){
      alertMensagem(
        titulo: 'Ops...',
        descricao: "Não foi possível fazer a leitura"
      );
    }
  }

  void onSearch(){
    List<Chat> chatsSearch =  [];
    for(Chat chat in chats){
      if(chat.name.toLowerCase().contains(searchController.text.toLowerCase())){
        chatsSearch.add(chat);
      }
    }

    _chatsStream.sink.add(chatsSearch);
  }


  //<! Métodos auxiliares>
  Future<void> _getUserByIDAndCreateChat({required String idUser}) async{
    try{
      final otherUser = await _getUserUseCase(idUser);
      Chat? newChat = await _createChatUseCase(user: _user, otherUser: otherUser);

      if(newChat != null) {
        chats.insert(0, newChat);
        _chatsStream.sink.add(chats);

        alertMensagem(
            titulo: "Chat criado",
            descricao: "O chat foi adicionado a sua lista.");
      }

    }catch(e){
      alertMensagem(titulo: "Ops...", descricao: "Não foi possível criar o chat.");
    }
  }


  //<! Funções de navegação>
  void openChat(Chat chat)=>
      Modular.to.pushNamed("/message_chat", arguments: chat);

  void openQrCode()=> Modular.to.pushNamed('/qrcode');

  void searchUser()=> Modular.to.pushNamed('/search_user', arguments: chats)
      .whenComplete(() => _chatsStream.sink.add(chats));


  void dispose(){
    _chatsStream.close();
    searchController.dispose();
  }

}