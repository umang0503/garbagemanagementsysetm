import 'package:firebase_auth/firebase_auth.dart';
class authservice
{
  Future<void>_createuser(String email,String password)async{
    try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e)
    {
      print("error:$e");
    }

  }
  Future<void>_signinuser(String email,String password)async{
  try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: email,
  password: password
  );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  }

}
