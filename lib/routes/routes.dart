import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/pages/age_select_page.dart';
import 'package:test_pro/pages/gender_select_page.dart';
import 'package:test_pro/pages/height_select_page.dart';
import 'package:test_pro/pages/landing_page.dart';
import 'package:test_pro/pages/sign_up_email_page.dart';
import 'package:test_pro/pages/name_page.dart';
import 'package:test_pro/pages/sign_in_email_page.dart';
import 'package:test_pro/pages/user_detail_page.dart';
import 'package:test_pro/pages/weight_select_page.dart';

class RouteGenerator{
  static Route _createRoute(Widget page){
    if(defaultTargetPlatform==TargetPlatform.iOS){
      return CupertinoPageRoute(builder: (context)=>page);
    }else{
      return MaterialPageRoute(builder: (context)=>page);
    }
  }

  static Route<dynamic>?routeGenerator(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/landingPage':
        return _createRoute(const LandingPage());
      case '/registerPageOne':
        return _createRoute(const SignUpWithEmailPage());
      case '/registerPageTwo':
        return _createRoute(const SignInEmailPage());
      case '/registerPageThree':
        return _createRoute(const NamePage());
      case '/ageSelectPage':
        return _createRoute(const AgeSelectPage());
      case '/heightSelectPage':
        return _createRoute(const HeightSelectPage());
      case '/genderSelectPage':
        return _createRoute(const GenderSelectPage());
      case '/weightSelectPage':
        return _createRoute(const WeightSelectPage());
      case '/usersDetailPage':
        return _createRoute(const UserDetailPage());
       case '/namePage':
        return _createRoute(const NamePage());
    
    default: 
          throw ('This route name does not exist');
  }
  }
}