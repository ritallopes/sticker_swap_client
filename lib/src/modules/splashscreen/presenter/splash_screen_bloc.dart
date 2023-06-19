import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/album_manager.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/login/domain/usecases/get_user.dart';

class SplashScreenBloc{

  final _auth = auth.FirebaseAuth.instance;
  final _user = Modular.get<User>();
  final _getUserUseCase = Modular.get<IGetUser>();
  final _albumManager = Modular.get<AlbumManager>();

  void verifyAuth() async{
    final user = _auth.currentUser;

    if(user == null) {
      Modular.to.pushNamedAndRemoveUntil("/login/", (_)=> false);
    } else{
      _albumManager.albumView = null;

      final resultUser = await _getUserUseCase(user.uid);
      _user.id = resultUser.id;
      _user.email = resultUser.email;
      _user.image = resultUser.image;
      _user.name = resultUser.name;
      _user.username = resultUser.username;

      Modular.to.pushNamedAndRemoveUntil("/home/", (_)=> false);
    }
  }
}