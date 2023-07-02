import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class Album {
  Map<int, List<Sticker>> collectionStickers;
  Album()
      : collectionStickers = {
          // 0: const [],
          // 1: const [],
          // 2: const [],
          // 3: const [],
        };

  Map<String, dynamic> toMap() {
    return {
      for (int i = 0; i < 38; i++)
        if (collectionStickers.containsKey(i))
          i.toString(): [
            for (Sticker sticker in collectionStickers[i]!) sticker.toMap(),
          ],
    };
  }

  @override
  String toString() {
    var result = StringBuffer();

    result.write("{\n");
    bool first = true;
    collectionStickers.forEach((key, value) {
      if (!first) {
        result.write('\n\n');
      }
      first = false;
      result.write('Grupo $key:\n');
      result.write(value);
    });
    result.write('}');

    return result.toString();
    // return collectionStickers.toString();
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Album &&
        other.runtimeType == runtimeType &&
        collectionStickers == other.collectionStickers;
  }

  @override
  int get hashCode => collectionStickers.hashCode;
}
