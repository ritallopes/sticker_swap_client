import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

import '../../infra/models/sticker_model.dart';

abstract class IGetAlbum{

  Future<Album> call({required User user});

}

  
class GetAlbumImpl extends IGetAlbum{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Album> call({required User user}) async{
    Album album = Album();

    final result = await firestore.collection("album").doc(user.id).get();
    print(result.data());

    album.collectionStickers = _generateAlbum(result.data()!);

    return album;
  }


  Map<int, List<StickerModel>> _generateAlbum(Map<String, dynamic> data){
    Map<int, List<StickerModel>> collectionStickers = {
      0 : [
        for(int i=1; i<=7; i++)
          if(data.containsKey("FWC $i"))
            StickerModel.fromMap(data["FWC $i"]),
      ],
      1 : [
        for(int i=8; i<=17; i++)
          if(data.containsKey("FWC $i"))
            StickerModel.fromMap(data["FWC $i"]),
      ],
      2 : [
        if(data.containsKey("FWC 18"))
          StickerModel.fromMap(data["FWC 18"]),
      ],
      3 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("QAT $i"))
            StickerModel.fromMap(data["QAT $i"]),
      ],
      4 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("ECU $i"))
            StickerModel.fromMap(data["ECU $i"]),
      ],
      5 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("SEN $i"))
            StickerModel.fromMap(data["SEN $i"]),
      ],
      6 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("NED $i"))
            StickerModel.fromMap(data["NED $i"]),
      ],
      7 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("ENG $i"))
            StickerModel.fromMap(data["ENG $i"]),
      ],
      8 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("IRN $i"))
            StickerModel.fromMap(data["IRN $i"]),
      ],
      9 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("USA $i"))
            StickerModel.fromMap(data["USA $i"]),
      ],
      10 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("WAL $i"))
            StickerModel.fromMap(data["WAL $i"]),
      ],
      11 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("ARG $i"))
            StickerModel.fromMap(data["ARG $i"]),
      ],
      12 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("KSA $i"))
            StickerModel.fromMap(data["KSA $i"]),
      ],
      13 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("MEX $i"))
            StickerModel.fromMap(data["MEX $i"]),
      ],
      14 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("POL $i"))
            StickerModel.fromMap(data["POL $i"]),
      ],
      15 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("FRA $i"))
            StickerModel.fromMap(data["FRA $i"]),
      ],
      16 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("AUS $i"))
            StickerModel.fromMap(data["AUS $i"]),
      ],
      17 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("DEN $i"))
            StickerModel.fromMap(data["DEN $i"]),
      ],
      18 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("TUN $i"))
            StickerModel.fromMap(data["TUN $i"]),
      ],
      19 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("ESP $i"))
            StickerModel.fromMap(data["ESP $i"]),
      ],
      20 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("CRC $i"))
            StickerModel.fromMap(data["CRC $i"]),
      ],
      21 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("GER $i"))
            StickerModel.fromMap(data["GER $i"]),
      ],
      22 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("JPN $i"))
            StickerModel.fromMap(data["JPN $i"]),
      ],
      23 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("BEL $i"))
            StickerModel.fromMap(data["BEL $i"]),
      ],
      24 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("CAN $i"))
            StickerModel.fromMap(data["CAN $i"]),
      ],
      25 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("MAR $i"))
            StickerModel.fromMap(data["MAR $i"]),
      ],
      26 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("CRO $i"))
            StickerModel.fromMap(data["CRO $i"]),
      ],
      27 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("BRA $i"))
            StickerModel.fromMap(data["BRA $i"]),
      ],
      28 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("SRB $i"))
            StickerModel.fromMap(data["SRB $i"]),
      ],
      29 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("SUI $i"))
            StickerModel.fromMap(data["SUI $i"]),
      ],
      30 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("CMR $i"))
            StickerModel.fromMap(data["CMR $i"]),
      ],
      31 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("POR $i"))
            StickerModel.fromMap(data["POR $i"]),
      ],
      32 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("GHA $i"))
            StickerModel.fromMap(data["GHA $i"]),
      ],
      33 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("URU $i"))
            StickerModel.fromMap(data["URU $i"]),
      ],
      34 : [
        for(int i=1; i<=20; i++)
          if(data.containsKey("KOR $i"))
            StickerModel.fromMap(data["KOR $i"]),
      ],
    };

    return collectionStickers;
  }

}