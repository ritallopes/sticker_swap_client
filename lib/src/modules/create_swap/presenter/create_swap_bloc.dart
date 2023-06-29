import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

class CreateSwapBloc {

  final user = Modular.get<User>();

  final _intexTelaStream = BehaviorSubject.seeded(0);
  Stream<int> get getIndexTela => _intexTelaStream.stream;

  void mudarTela(int indexNovaTela) {
    _intexTelaStream.sink.add(indexNovaTela);
  }

  void dispose() {
    _intexTelaStream.close();
  }
}
