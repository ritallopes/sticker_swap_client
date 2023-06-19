import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

class SettingsBloc{

  final user= Modular.get<User>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();

  void initScreen(){
    email.text= user.email!;
    name.text= user.name!;
    username.text= user.username ?? "";
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