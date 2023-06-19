import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/alerts/alert_dialog.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/register/domain/usecases/register_user.dart';

class RegisterBloc{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController urlImageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final registerUsecase = Modular.get<IRegisterUser>();

  final _loadingStream = BehaviorSubject<bool>();
  Stream<bool> get isLoading=> _loadingStream.stream;

  void verifyAuth()=> Modular.to.pushNamedAndRemoveUntil("/", (_)=> false);

  Future<Map?> register()async{
    if(passwordController.text == passwordConfirmController.text){
      _loadingStream.sink.add(true);
      bool sucesso = await registerUsecase(
          User(
            email: emailController.text,
            name: nameController.text,
            image: urlImageController.text,
          ),
          passwordController.text
      );

      if(sucesso) {
        verifyAuth();
      } else {
        alertMensagem(
          titulo: "Ops...",
          descricao: "Não foi possível registrar o usuário, tente novamente mais tarde."
        );
      }
    }else{
      alertMensagem(
          titulo: "Ops...",
          descricao: "As senhas informadas não são iguais!"
      );
    }
    _loadingStream.sink.add(false);
  }

  void dispose(){
    _loadingStream.close();

    nameController.dispose();
    emailController.dispose();
    urlImageController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }
}