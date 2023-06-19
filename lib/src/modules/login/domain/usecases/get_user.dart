import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

abstract class IGetUser{
  Future<User> call (String idUser);
}

class GetUserImpl implements IGetUser{

  final _firebase = FirebaseFirestore.instance;

  @override
  Future<User> call(String idUser) async{
    try{
      final result = await _firebase.collection("user").doc(idUser).get();

      final map = result.data()!;
      return User(
        image: map["image"],
        name: map["name"],
        email: map["email"],
        id: map["id"],
        username: map["username"],
      );
    }catch(e){
      rethrow;
    }
  }

}