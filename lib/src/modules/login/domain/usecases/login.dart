import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class ILogin{
  Future<bool> call (String email, String password);
}

class LoginImpl implements ILogin{

  final _auth = auth.FirebaseAuth.instance;

  @override
  Future<bool> call(String email, String password) async{
    try{
      final user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    }catch(e){
      rethrow;
    }
  }

}