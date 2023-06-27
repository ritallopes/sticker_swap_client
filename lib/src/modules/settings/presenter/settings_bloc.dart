import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/settings/domain/usecases/update_username.dart';

class SettingsBloc{

  final user= Modular.get<User>();
  final updateUsernameUseCase = Modular.get<IUpdateUsername>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();

  void initScreen(){
    email.text= user.email!;
    name.text= user.name!;
    username.text= user.username ?? "";
  }

  Future<void> editUsername() async {
    final editedUsername = username.text;
    
    if (await updateUsernameUseCase(user.id!, editedUsername)){
      print(">>> Username successfully updated!");
    } else { 
      print(">>> [Error] it was not possible to update the username!");
    }
  }

  void logout() async {
    auth.FirebaseAuth.instance.signOut();
    Modular.to.pushNamedAndRemoveUntil('/login/', (_)=> false);
  }

  void dispose(){
    email.dispose();
    name.dispose();
    username.dispose();
  }
}
