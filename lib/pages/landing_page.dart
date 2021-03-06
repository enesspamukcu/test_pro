import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/api/firebase_api.dart';
import 'package:test_pro/constants.dart';
import 'package:test_pro/provider/user_provider.dart';
import 'package:test_pro/widgets/login_button_row.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late FirebaseAuth auth;
   @override
  void initState() {
    auth =FirebaseAuth.instance;
    super.initState();
    FirebaseApi.authStateChanges(context);
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => userProvider.signOutUser(),icon: const Icon(Icons.logout),color:Colors.red,iconSize: 26,)
        ],
        title: const Text('Test Pro Gym',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(14.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset('assets/images/exercise.png',width: 160.w,height: 160.h),
              SizedBox(height: 30.h,),
              Text('Test Pro Gym',style: TextStyle(fontSize: 32.sp),),
              SizedBox(height: 30.h,),
              ElevatedButton(style:Constants.emailLoginButtonStyle, onPressed: (){
                Navigator.pushNamed(context, '/registerPageOne');
              }, child: const LoginButtonRow(iconData: Icons.email,loginText:'Continue With E-mail')),
              SizedBox(height: 10.h,),
              ElevatedButton(style: Constants.googleLoginButtonStyle,onPressed: ()async{
                if(auth.currentUser==null){
                  await userProvider.signInwWithGoogle(context);
                    Future.delayed(const Duration(milliseconds: 500),(){
                    Navigator.pushReplacementNamed(context,'/usersDetailPage');
                    });
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please sign out before sign in')));
                }
              }, child: const LoginButtonRow(iconData: Icons.home, loginText: 'Continue With Google')),
              SizedBox(height: 10.h,),
              ElevatedButton(style:Constants.facebookLoginButtonStyle ,onPressed: (){}, child: const LoginButtonRow(iconData: Icons.facebook, loginText: 'Continue With Facebook')),
              SizedBox(height: 10.h,),
              ElevatedButton(style:Constants.withoutSigningButton ,onPressed: (){}, child: const LoginButtonRow(iconData: Icons.login, loginText: 'Continue Without SignUp')),
            ],
          ),
        ),
      ),
    ); 
  }
}