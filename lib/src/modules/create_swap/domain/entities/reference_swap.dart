import 'package:sticker_swap_client/src/core/entities/album.dart';

class ReferenceSwap {
  Album stickersNeed; // figurinhas do album do outro que gostaria
  Album stickersSender; // figurinhas do album que serão enviadas

  ReferenceSwap({required this.stickersSender, required this.stickersNeed});

  @override
  String toString() {
    return 'ReferenceSwap {\n Album das figurinhas desejadas:\n $stickersNeed \n\n Album das figurinhas disponíveis para troca:\n $stickersSender\n}';
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ReferenceSwap &&
        other.runtimeType == runtimeType &&
        stickersNeed == other.stickersNeed &&
        stickersSender == other.stickersSender;
  }

  @override
  int get hashCode => Object.hash(stickersNeed, stickersSender);
}
