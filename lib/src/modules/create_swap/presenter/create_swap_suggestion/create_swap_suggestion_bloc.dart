import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:sticker_swap_client/src/modules/create_swap/domain/entities/suggestion_swap_type.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_suggestion/create_swap_suggestion_module.dart';

import '../../../../core/entities/album.dart';
import '../../../sticker/domain/entities/sticker.dart';
import '../../domain/entities/reference_swap.dart';

class CreateSwapSuggestionBloc {
  Function(int) proximaTela;
  String nameOtherUser;
  ReferenceSwap referenceSwap;
  SuggestionSwapType? suggestionType = SuggestionSwapType.special;
  TextEditingController maxTradedStickers = TextEditingController(text: '0');
  TextEditingController maxReceivedStickers = TextEditingController(text: "0");

  CreateSwapSuggestionBloc({
    required this.referenceSwap,
    required this.proximaTela,
    required this.nameOtherUser,
  });

  Future<void> generateSuggestion() async{

    if(maxTradedStickers.text == null || maxTradedStickers.text.isEmpty
        || maxReceivedStickers.text == null || maxReceivedStickers.text.isEmpty){
      //TODO: mensagem de erro
      return;
    }

    switch(suggestionType){
      case SuggestionSwapType.special:
        _specialSwap();
        break;
      case SuggestionSwapType.standard:
        _standardSwap();
        break;
      case SuggestionSwapType.random:
        _randomSwap();
        break;
    }
    proximaTela(2);
  }

  void _specialSwap(){
      int countNeedStickers = 0;
      int countSendStickers = 0;
      int? numMaxReceivedStickers = int.tryParse(maxReceivedStickers.text);
      int? numMaxTradedStickers = int.tryParse(maxTradedStickers.text);

      if(referenceSwap.stickersNeed.collectionStickers.containsKey(0)){
        List<Sticker> specialNeedStickers = referenceSwap.stickersNeed.collectionStickers[0]!;
        for(Sticker sticker in specialNeedStickers){
          if(countNeedStickers < numMaxReceivedStickers!) {
            sticker.quantity = (sticker.quantity + 1) % 2;
            countNeedStickers++;
          }
        }
      }

      if(referenceSwap.stickersSender.collectionStickers.containsKey(0)){
        List<Sticker> specialSendStickers = referenceSwap.stickersSender.collectionStickers[0]!;
        for(Sticker sticker in specialSendStickers){
          if(countSendStickers < numMaxTradedStickers!) {
            sticker.quantity = (sticker.quantity + 1) % 2;
            countSendStickers++;
          }
        }
      }
  }

  void _standardSwap(){
    int countNeedStickers = 0;
    int countSendStickers = 0;
    int? numMaxReceivedStickers = int.tryParse(maxReceivedStickers.text);
    int? numMaxTradedStickers = int.tryParse(maxTradedStickers.text);

    for(int i=1; i < 35; i++){
      if(referenceSwap.stickersNeed.collectionStickers.containsKey(i)){
        List<Sticker> stdNeedStickers = referenceSwap.stickersNeed.collectionStickers[i]!;
        for(Sticker sticker in stdNeedStickers){
          if(countNeedStickers < numMaxReceivedStickers!) {
            sticker.quantity = (sticker.quantity + 1) % 2;
            countNeedStickers++;
          }
        }
      }

      if(referenceSwap.stickersSender.collectionStickers.containsKey(i)){
        List<Sticker> stdSendStickers = referenceSwap.stickersSender.collectionStickers[i]!;
        for(Sticker sticker in stdSendStickers){
          if(countSendStickers < numMaxTradedStickers!) {
            sticker.quantity = (sticker.quantity + 1) % 2;
            countSendStickers++;
          }
        }
      }
    }

  }

  void _randomSwap(){
    int countNeedStickers = 0;
    int countSendStickers = 0;
    int? numMaxReceivedStickers = int.tryParse(maxReceivedStickers.text);
    int? numMaxTradedStickers = int.tryParse(maxTradedStickers.text);

    for(int i=0; i < 35; i++){
      if(referenceSwap.stickersNeed.collectionStickers.containsKey(i)){
        List<Sticker> stdNeedStickers = referenceSwap.stickersNeed.collectionStickers[i]!;
        for(Sticker sticker in stdNeedStickers){
          if(countNeedStickers < numMaxReceivedStickers!) {
            sticker.quantity = (sticker.quantity + 1) % 2;
            countNeedStickers++;
          }
        }
      }

      if(referenceSwap.stickersSender.collectionStickers.containsKey(i)){
        List<Sticker> stdSendStickers = referenceSwap.stickersSender.collectionStickers[i]!;
        for(Sticker sticker in stdSendStickers){
          if(countSendStickers < numMaxTradedStickers!) {
            sticker.quantity = (sticker.quantity + 1) % 2;
            countSendStickers++;
          }
        }
      }
    }
  }

  void changeSuggestionType(SuggestionSwapType? value){
    suggestionType = value;
  }

  int get quantNeedSticker => _countStickersAlbum(referenceSwap.stickersNeed);
  int get quantSendSticker => _countStickersAlbum(referenceSwap.stickersSender);

  int _countStickersAlbum(Album album){
    int count =0;
    for(int i =0; i < 35; i++){
      if(album.collectionStickers.containsKey(i)){
        count+=album.collectionStickers[i]!.length;
      }
    }
    return count;
  }

}
