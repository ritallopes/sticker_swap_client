import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';


class CreateSwapAlbumBloc {
  final String nameOtherUser;
  final ReferenceSwap referenceSwap;
  final Function(ReferenceSwap referenceSwap) sendRefereceSwap;

  CreateSwapAlbumBloc({
    required this.referenceSwap,
    required this.nameOtherUser,
    required this.sendRefereceSwap
  });

  final _stickersStream = BehaviorSubject.seeded(true);
  Stream<bool> get getSwap => _stickersStream.stream;

  void chageStatusSticker(Sticker sticker) {
    sticker.quantity = (sticker.quantity + 1) % 2;
    _stickersStream.sink.add(true);
  }

  void dispose() {
    _stickersStream.close();
  }
}
