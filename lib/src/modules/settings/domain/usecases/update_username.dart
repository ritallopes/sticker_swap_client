import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';


abstract class IUpdateUsername{
  Future<bool> call (String userId, String username);
}

class UpdateUsernameImpl implements IUpdateUsername{

  final _storage = FirebaseFirestore.instance;

  @override
  Future<bool> call(String userId, String username) async{
    try{
      
      await _storage.collection("user").doc(userId).update({
        "username": username,
      });

      return true;
    }catch(e){
      debugPrint(e.toString());
    }

    return false;
  }

}
