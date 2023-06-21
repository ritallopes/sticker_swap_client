import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

abstract class IGetUsersByUsername{
  Future<List<User>> call (String username);
}

class GetUsersByUsernameImpl implements IGetUsersByUsername{

  final _firebase = FirebaseFirestore.instance;

  @override
  Future<List<User>> call (String username) async{
    try{
      List<User> users = <User>[];
      final result = await _firebase.collection("user")
          .where("username", isGreaterThanOrEqualTo: username)
          .where("username", isLessThanOrEqualTo: '${username}z')
          .get();

      for(final doc in result.docs){
        Map<String, dynamic> map = doc.data();

        users.add(User(
          image: map["image"],
          name: map["name"],
          email: map["email"],
          id: map["id"],
          username: map["username"],
        ));
      }

      return users;
    }catch(e){
      print(e);
      rethrow;
    }
  }

}