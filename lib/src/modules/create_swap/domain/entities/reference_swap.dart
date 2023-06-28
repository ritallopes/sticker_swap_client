import 'package:sticker_swap_client/src/core/entities/album.dart';

class ReferenceSwap{
  Album stickersNeed;
  Album stickersSender;

  ReferenceSwap({
    required this.stickersSender,
    required this.stickersNeed
  });
}