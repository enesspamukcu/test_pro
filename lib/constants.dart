import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  Constants._();

  static ButtonStyle emailLoginButtonStyle = ElevatedButton.styleFrom(primary: Colors.grey.shade600,padding: EdgeInsets.all(17.0.h));
  static ButtonStyle googleLoginButtonStyle = ElevatedButton.styleFrom(padding: EdgeInsets.all(17.0.h));
  static ButtonStyle facebookLoginButtonStyle = ElevatedButton.styleFrom(primary: const Color.fromRGBO(66, 103, 178,1),padding: EdgeInsets.all(17.0.h));
  static ButtonStyle withoutSigningButton = ElevatedButton.styleFrom(primary:Colors.blueAccent,padding: EdgeInsets.all(17.0.h));
  static ButtonStyle loginButtonInActive = ElevatedButton.styleFrom(primary:Colors.grey);
  static ButtonStyle loginButtonActive = ElevatedButton.styleFrom(primary:Colors.blue);
  static Color inActiveGenderIconColor = Colors.grey.shade300;
  static Color activeMaleColor = Colors.indigo.shade600;
  static Color activeFemaleColor = Colors.pink;
  static TextStyle userDetailPageTitle = const TextStyle(fontSize: 25,fontWeight: FontWeight.w500);
  static TextStyle userDetailPageText = const TextStyle(fontSize: 25,);
  
}