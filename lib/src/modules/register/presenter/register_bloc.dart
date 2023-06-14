import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterBloc{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  void verifyAuth()=> Modular.to.pushReplacementNamed("/login/");

  Future<Map?> register()async{

  }
}