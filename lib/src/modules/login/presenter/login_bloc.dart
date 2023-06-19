import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/auth.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/login/domain/usecases/login.dart';

class LoginBloc{

  final user = Modular.get<User>();
  final auth = Modular.get<Auth>();
  final loginUseCase = Modular.get<ILogin>();

  final _loadingStream = BehaviorSubject<bool>();
  Stream<bool> get isLoading=> _loadingStream.stream;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void verifyAuth()=> Modular.to.pushNamedAndRemoveUntil("/", (_)=> false);
  void toRegisterScreen()=> Modular.to.pushNamed("/register/");

  Future<void> login() async{
    _loadingStream.sink.add(true);
    if(await loginUseCase(emailController.text, passwordController.text)){
      verifyAuth();
    }
    _loadingStream.sink.add(false);
  }

  void dispose(){
    _loadingStream.close();
    emailController.dispose();
    passwordController.dispose();
  }

}
