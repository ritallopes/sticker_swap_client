import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/create_chat.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/get_users_by_username.dart';

class SearchUserChatBloc{
  final _user = Modular.get<User>();
  final _createChatUseCase = Modular.get<ICreateChat>();
  final _getUsersByUsernameUseCase = Modular.get<IGetUsersByUsername>();

  List<User> users = <User>[];

  TextEditingController searchController = TextEditingController();

  final BehaviorSubject<bool> _loadingStream = BehaviorSubject();
  Stream<bool> get isLoading => _loadingStream.stream;

  void onSearch() async{
    try{
      _loadingStream.sink.add(true);
      final text = searchController.text;

      users = await _getUsersByUsernameUseCase(text);
      _loadingStream.sink.add(false);
    }catch(e){
      _loadingStream.sink.addError(e);
    }
  }

  Future<bool> _createChat({required User user, required User otherUser}) async{
    try{
      return await _createChatUseCase(user: user, otherUser: otherUser);
    }catch(e){
      rethrow;
    }
  }


  void dispose(){
    _loadingStream.close();
    searchController.dispose();
  }
}