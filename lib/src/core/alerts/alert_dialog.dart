import 'package:flutter/material.dart' show AlertDialog, Navigator, Text, TextButton, Widget, showDialog;
import 'package:flutter_modular/flutter_modular.dart';

Future<bool> alertConfirme({
  required String titulo,
  required String descricao,
}) async {
  bool confirm = false;

  await showDialog(
    context: Modular.routerDelegate.navigatorKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(descricao),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () {
                confirm = true;
                Navigator.pop(context);
              },
              child: const Text("Confirmar"))
        ],
      );
    },
  );

  return confirm;
}

void alertMensagem({required String titulo, required String descricao}) {
  showDialog(
    context: Modular.routerDelegate.navigatorKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(descricao),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          )
        ],
      );
    },
  );
}
