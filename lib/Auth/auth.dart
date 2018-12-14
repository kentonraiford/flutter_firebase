import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseAuth
{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password); // So it will be visible to our LoginPage
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<String> signInWithEmailAndPassword(String email, String password) async
  {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password); //returns a user and "await" is used when method is asynchronous
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async
  {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<String> currentUser() async //Check if user is logged in
  {
    FirebaseUser user = await _firebaseAuth.currentUser(); // will return a user if the user is currently signed in.
    return user.uid;
  }

  Future<void> signOut() async
  {
    return _firebaseAuth.signOut();
  }

}