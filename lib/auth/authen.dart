import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
   Future<String> signInWithEmailAndPassword(String email, String password);
   Future<String> signUpWithEmailAndPassword(String email, String password);
}

class Auth implements BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password) async{
    UserCredential get= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          User? user = get.user;

          return user!.uid;
  }

  Future<String> signUpWithEmailAndPassword(String email, String password) async{

    UserCredential get = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user=get.user;

      return user!.uid;

  }
}