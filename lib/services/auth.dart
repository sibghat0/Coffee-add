import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_todo/modules/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj on FirebaseUser
  SUser _userFromFirebaseUser(User user) {
    return user !=null ? SUser(uid: user.uid) : null;
  }

  //auth change stream
  Stream<SUser> get user{
    return _auth.authStateChanges()
        // .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email & password
  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //register in email & password
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

//sign out
Future signOut() async{
    try{
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
}

}