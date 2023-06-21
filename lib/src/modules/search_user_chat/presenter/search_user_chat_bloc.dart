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

  TextEditingController searchController = TextEditingController();

  final BehaviorSubject<List<User>> _usersStream = BehaviorSubject();
  Stream<List<User>> get getUsersView => _usersStream.stream;

  void onSearch(){}

  Future<bool> _createChat({required User user, required User otherUser}) async{
    try{
      return await _createChatUseCase(user: user, otherUser: otherUser);
    }catch(e){
      rethrow;
    }
  }


  void dispose(){
    _usersStream.close();
    searchController.dispose();
  }
}