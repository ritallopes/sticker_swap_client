import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/register/presenter/register_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ModularState<RegisterScreen, RegisterBloc> {

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar-se')),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 60, 25, 40),
              child: Image.asset('assets/images/logo.png'),
            ),
            _inputText(
              labelText: 'Email',
              hintText: 'email@example.com',
              controller: controller.emailController,
              prefixIcon: const Icon(Icons.email),
            ),
            _inputText(
              labelText: 'Nome',
              controller: controller.nameController,
              prefixIcon: const Icon(Icons.person),
            ),
            _inputText(
              labelText: 'Url Imgem',
              hintText: 'Ex: https://imagem.com/usuario.png',
              controller: controller.urlImageController,
              prefixIcon: const Icon(Icons.image),
            ),
            _inputText(
              obscureText: true,
              labelText: 'Senha',
              controller: controller.passwordController,
              prefixIcon: const Icon(Icons.key),
            ),
            _inputText(
              obscureText: true,
              labelText: 'Confirme senha',
              controller: controller.passwordConfirmController,
              prefixIcon: const Icon(Icons.key),
            ),
            StreamBuilder<bool>(
              stream: controller.isLoading,
              initialData: false,
              builder: (context, snapshot) {
                if(snapshot.data!) return const Center(child: CircularProgressIndicator());

                return Container(
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: controller.register,
                      child: const Text('Cadastre-se'),
                    ));
              }
            ),
          ],
        )
      )
    );
  }


  Widget _inputText({
    String? hintText,
    bool obscureText = false,
    required Icon prefixIcon,
    required String labelText,
    required TextEditingController controller
  }){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),
          ),
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }

}