import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class RegisterAlbumConfig{
  static Map<String, Map<String, dynamic>> init(){
    return {
    for(int i=1; i<=7; i++)
      "FWC $i": Sticker(id: 2, text: "FWC $i", idGroup: 0, quantity: 0).toMap(),
    for(int i=8; i<=17; i++)
      "FWC $i": Sticker(id: i, text: "FWC $i", idGroup: 1, quantity: 0).toMap(),

      "FWC 18": Sticker(id: 18, text: "FWC 18", idGroup: 2, quantity: 0).toMap(),

    for(int i=1; i<=20; i++)
      "QAT $i": Sticker(id: i, text: "QAT $i", idGroup: 3, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "ECU $i" : Sticker(id: i, text: "ECU $i", idGroup: 4, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "SEN $i" : Sticker(id: i, text: "SEN $i", idGroup: 5, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "NED $i": Sticker(id: i, text: "NED $i", idGroup: 6, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "ENG $i": Sticker(id: i, text: "ENG $i", idGroup: 7, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "IRN $i": Sticker(id: i, text: "IRN $i", idGroup: 8, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "USA $i": Sticker(id: i, text: "USA $i", idGroup: 9, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "WAL $i": Sticker(id: i, text: "WAL $i", idGroup: 10, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "ARG $i": Sticker(id: i, text: "ARG $i", idGroup: 11, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "KSA $i": Sticker(id: i, text: "KSA $i", idGroup: 12, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "MEX $i": Sticker(id: i, text: "MEX $i", idGroup: 13, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "POL $i": Sticker(id: i, text: "POL $i", idGroup: 14, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "FRA $i": Sticker(id: i, text: "FRA $i", idGroup: 15, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "AUS $i": Sticker(id: i, text: "AUS $i", idGroup: 16, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "DEN $i":Sticker(id: i, text: "DEN $i", idGroup: 17, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "TUN $i":Sticker(id: i, text: "TUN $i", idGroup: 18, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "ESP $i":Sticker(id: i, text: "ESP $i", idGroup: 19, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "CRC $i":Sticker(id: i, text: "CRC $i", idGroup: 20, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "GER $i":Sticker(id: i, text: "GER $i", idGroup: 21, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "JPN $i": Sticker(id: i, text: "JPN $i", idGroup: 22, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "BEL $i": Sticker(id: i, text: "BEL $i", idGroup: 23, quantity:0).toMap(),
        for(int i=1; i<=20; i++)
          "CAN $i": Sticker(id: i, text: "CAN $i", idGroup: 24, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "MAR $i": Sticker(id: i, text: "MAR $i", idGroup: 25, quantity:0).toMap(),

      for(int i=1; i<=20; i++)
      "CRO $i": Sticker(id: i, text: "CRO $i", idGroup: 27, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "BRA $i": Sticker(id: i, text: "BRA $i", idGroup: 27, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "SRB $i": Sticker(id: i, text: "SRB $i", idGroup: 28, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "SUI $i": Sticker(id: i, text: "SUI $i", idGroup: 29, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "CMR $i": Sticker(id: i, text: "CMR $i", idGroup: 30, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "POR $i": Sticker(id: i, text: "POR $i", idGroup: 31, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "GHA $i": Sticker(id: i, text: "GHA $i", idGroup: 32, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "URU $i": Sticker(id: i, text: "URU $i", idGroup: 33, quantity:0).toMap(),
    for(int i=1; i<=20; i++)
      "KOR $i": Sticker(id: i, text: "KOR $i", idGroup: 34, quantity:0).toMap()
    };
  }
}