import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/settings/presenter/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ModularState<SettingsScreen, SettingsBloc> {

  @override
  void initState() {
    controller.initScreen();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: const Text('Configurações', style: TextStyle(color: Colors.black),),
              centerTitle: true,
            ),

            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: buildProfileImage(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text(
                        'Mudar foto de perfil',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: controller.name,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Nome',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: controller.username,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Username',
                      ),
                    ),
                  ),


                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top:20),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Sair'),
                      onPressed: () async {
                        _showLogOutModalDialog(context);
                      },
                    )
                  ),
                ],
              ),
            )));
  }

  _showLogOutModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            content: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                  text:
                  "Você tem certeza que deseja sair do Sticker Swap?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black,
                      wordSpacing: 1)),
            ),
            actions: [
              Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: controller.logout,
                    child: const Text('Sim'),
                  ))
            ],
          );
        });
  }

  CircleAvatar buildProfileImage(){
    ImageProvider? image;
    if(controller.user.image == null){
      image = const AssetImage('assets/images/logo.png');
    }else{
      image = NetworkImage(controller.user.image!);
    }

    return CircleAvatar(
      radius: 55,
      backgroundColor: Colors.white,
      backgroundImage: image,
    );
  }


}