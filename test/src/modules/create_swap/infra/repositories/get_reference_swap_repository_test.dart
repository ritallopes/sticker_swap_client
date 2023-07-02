import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/reference_swap.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart';
import 'package:sticker_swap_client/src/modules/create_swap/infra/repositories/get_reference_swap_repository.dart';

import 'get_reference_swap_repository_test.mocks.dart';
import 'util/filter_album.dart';
import 'util/generate_base_album.dart';

@GenerateNiceMocks([MockSpec<IGetReferenceSwapDatasource>()])
void main() {
  var mockdatasource = MockIGetReferenceSwapDatasource();
  String idSender = 'idSender';
  String idOtherUser = 'idOtherUser';

  // initial data
  Album albumSender = Album();
  Album albumOtherUser = Album();

  // expected answer
  Album stickersNeed = Album();
  Album stickersSender = Album();

  test('Teste albums vazios', () async {
    // initial data
    albumSender = generateUniformAlbum(0);
    albumOtherUser = generateUniformAlbum(0);

    // setup mocks
    when(mockdatasource.getReference(
      idSender: idSender,
      idOtherUser: idOtherUser,
    )).thenAnswer((_) async => {
          idSender: albumSender,
          idOtherUser: albumOtherUser,
        });

    // expected answer
    stickersNeed = FilterUtils.prepareAlbumToExchange(generateUniformAlbum(0));
    stickersSender =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(0));

    ReferenceSwap referenceSwapExp = ReferenceSwap(
        stickersNeed: stickersNeed, stickersSender: stickersSender);

    final result =
        await GetReferenceSwapRepository(mockdatasource).getReference(
      idSender: idSender,
      idOtherUser: idOtherUser,
    );

    expect(result, referenceSwapExp);
  });

  test('Teste album vazio e album completo com todas as figurinhas repetidas',
      () async {
    // initial data
    albumSender = generateUniformAlbum(0);
    albumOtherUser = generateUniformAlbum(2);

    // setup mocks
    when(mockdatasource.getReference(
      idSender: idSender,
      idOtherUser: idOtherUser,
    )).thenAnswer((_) async => {
          idSender: albumSender,
          idOtherUser: albumOtherUser,
        });

    // expected answer
    stickersNeed = FilterUtils.prepareAlbumToExchange(generateUniformAlbum(1));
    stickersSender =
        FilterUtils.prepareAlbumToExchange(generateUniformAlbum(0));

    ReferenceSwap referenceSwapExp = ReferenceSwap(
        stickersNeed: stickersNeed, stickersSender: stickersSender);

    final result =
        await GetReferenceSwapRepository(mockdatasource).getReference(
      idSender: idSender,
      idOtherUser: idOtherUser,
    );

    expect(result, referenceSwapExp);
  });
}
