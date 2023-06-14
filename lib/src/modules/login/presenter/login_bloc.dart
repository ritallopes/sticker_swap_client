import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/auth.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

class LoginBloc{

  final user = Modular.get<User>();
  final auth = Modular.get<Auth>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void verifyAuth()=> Modular.to.pushReplacementNamed("/home/");
  void toRegisterScreen()=> Modular.to.pushNamed("/register/");

  Future<void> login() async{
    verifyAuth();
  }

}
