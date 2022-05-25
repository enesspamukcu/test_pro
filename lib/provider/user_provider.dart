import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_pro/api/firebase_api.dart';
import 'package:test_pro/model/users_info.dart';

class UserProvider with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UsersInfo createdUser = UsersInfo(name: "name", gender: "gender", height: 1, age: 1, weight: 1, id: '1');
  
  void addUserInfo(UsersInfo usersInfo) =>FirebaseApi.createUserInfo(usersInfo);

  void readUsersInfo() => FirebaseApi.readUsersInfo();

  void createUserWithEmailAndPassword(String email,String password,BuildContext context) =>FirebaseApi.createUserWithEmailAndPassword(email, password, context);

  void signOutUser()=>FirebaseApi.signOutUser();

  void signInWithEmailAndPassword(String email,String password,BuildContext context) => FirebaseApi.signInWithEmailAndPassword(email, password, context);
  
  void signInwWithGoogle(BuildContext context) =>FirebaseApi.signInWithGoogle(context);
}
