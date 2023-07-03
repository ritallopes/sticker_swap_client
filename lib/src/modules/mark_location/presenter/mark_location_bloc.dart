import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';

class MarkLocationBloc{

  final Future<void> Function(MessagePlace) markLocation;
  MarkLocationBloc({required this.markLocation});

  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void formatText(TextEditingController controller, String separator) {
    final text = controller.text;
  
    if (text.length == 2 && !text.contains(separator)) {
      controller.text = text + separator;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }

  void sendMessage() async{
    MessagePlace message = MessagePlace(
        time: timeController.text,
        place: placeController.text,
        date: dateController.text,
        status: StatusMessageConfirm.wait,
        idSender: Modular.get<User>().id!
    );
    await markLocation(message);
    Modular.to.pop();
  }

  void dispose(){
    dateController.dispose();
    placeController.dispose();
    timeController.dispose();
  }

  void initState() {
    dateController.addListener(() {
      formatText(dateController, "/");
    });

    timeController.addListener(() {
      formatText(timeController, ":");
    });
  }

}
