import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/app.dart';
import 'package:sticker_swap_client/src/app_module.dart';

void main() async{
  runApp(ModularApp(module: AppModule(), child: App(),));
}