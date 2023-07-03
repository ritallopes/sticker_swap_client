import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_album/create_swap_album_bloc.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/element_sticker.dart';
import 'package:sticker_swap_client/src/utils/const/group_names_utils.dart';

class CreateSwapAlbumScreen extends StatefulWidget {
  const CreateSwapAlbumScreen({super.key});
  @override
  _CreateSwapAlbumScreenState createState() => _CreateSwapAlbumScreenState();
}

class _CreateSwapAlbumScreenState extends State<CreateSwapAlbumScreen> {
  final controller = Modular.get<CreateSwapAlbumBloc>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: StreamBuilder<bool>(
                stream: controller.getSwap,
                builder: (_, snapshot) {
                  return ListView(
                    children: [
                      Container(
                        width: 400,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/info_icon.png',
                              height: 25,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Expanded(
                              child: Text(
                                "Selecione as figurinhas que deseja trocar.",
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 98, 235, 1),
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
                        child: Text(
                          "Figurinhas de ${controller.nameOtherUser}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (int i = 0; i <= 35; i++)
                        if (controller
                            .referenceSwap.stickersNeed.collectionStickers
                            .containsKey(i))
                          _createGroupSticker(
                              i,
                              (controller.referenceSwap.stickersNeed
                                  .collectionStickers[i] as List<Sticker>)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 0, 5),
                        child: Text(
                          "Suas repetidas",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (int i = 0; i <= 35; i++)
                        if (controller
                            .referenceSwap.stickersSender.collectionStickers
                            .containsKey(i))
                          _createGroupSticker(
                              i,
                              (controller.referenceSwap.stickersSender
                                  .collectionStickers[i] as List<Sticker>)),
                    ],
                  );
                })),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              controller.sendRefereceSwap(controller.referenceSwap);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              backgroundColor: const Color.fromRGBO(154, 16, 50, 1),
              side: const BorderSide(color: Color(0xff9A1032)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text("Confirmar",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }

  Widget _createGroupSticker(int i, List<Sticker> stickers) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                child: Text(
                  GroupNamesUtils.names[i]!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ],
          ),
          for (Sticker sticker in stickers)
            ElementSticker(
              sticker: sticker,
              addSticker: controller.chageStatusSticker,
              detailsSticker: (_) {},
            ),
        ],
      ),
    );
  }
}
