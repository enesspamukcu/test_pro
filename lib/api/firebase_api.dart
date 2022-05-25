import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_pro/model/users_info.dart';


class FirebaseApi{
  static Future<void> createUserInfo(UsersInfo userInfo)async{
    final docUsers = FirebaseFirestore.instance.collection('usersinfo').doc(FirebaseAuth.instance.currentUser!.uid);
    await docUsers.set(userInfo.toJson());
  }

  static Future<DocumentSnapshot<Map<String,dynamic>>>readUsersInfo()async{
    var currentUserDocuments = FirebaseFirestore.instance.collection('usersinfo').doc(FirebaseAuth.instance.currentUser?.uid).get();
    return currentUserDocuments;
  }

  static void createUserWithEmailAndPassword(String email,String password,BuildContext context)async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);
    }
  }

  static void signOutUser()async{
    var user = GoogleSignIn().currentUser;
      if (user != null) {
     await GoogleSignIn().signOut();
 }
    FirebaseAuth.instance.signOut();
}

  static void authStateChanges(BuildContext context){
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User is currently signed out!')));
    } else {
      debugPrint('User is signed in!');
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User is signed in!')));
    }
  });
  }

  static void signInWithEmailAndPassword(String email,String password,BuildContext context)async{
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signInWithGoogle(BuildContext context)async{
    try {
       GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  
}