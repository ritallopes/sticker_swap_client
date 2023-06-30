import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/usecases/get_reference_swap.dart';

class CreateSwapBloc {

  late String nameOtherUser;
  late ReferenceSwap referenceSwap;

  final user = Modular.get<User>();
  final _getReference = Modular.get<IGetReferenceSwap>();

  final _intexTelaStream = BehaviorSubject.seeded(0);
  Stream<int> get getIndexTela => _intexTelaStream.stream;


  Future<void> getReferenceSwap({Chat? chat}) async{
    final referenceSwap = await _getReference(
      idSender: user.id!,
      idOtherUser: chat!.idUser,
    );
    nameOtherUser = chat.name;

    this.referenceSwap = referenceSwap;
    mudarTela(1);
  }

  void mudarTela(int indexNovaTela) {
    _intexTelaStream.sink.add(indexNovaTela);
  }

  void dispose() {
    _intexTelaStream.close();
  }
}
