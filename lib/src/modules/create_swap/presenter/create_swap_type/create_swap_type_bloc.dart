import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';

class CreateSwapTypeBloc {

  Function(int) proximaTela;
  String nameOtherUser;
  ReferenceSwap referenceSwap;
  CreateSwapTypeBloc({
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });


  Future<void> orgSwap() async{
    proximaTela(2);
  }

  int get quantNeedSticker => 2;
  int get quantSendSticker => 2;

}