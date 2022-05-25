import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/api/firebase_api.dart';
import 'package:test_pro/pages/sign_up_email_page.dart';
import 'package:test_pro/provider/user_provider.dart';

class SignInEmailPage extends StatefulWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  State<SignInEmailPage> createState() => _SignInEmailPageState();
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    FirebaseApi.authStateChanges(context);
  }
  List<bool> isSelected = [false, true];
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

   return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ToggleButtons(
                    color: const Color.fromRGBO(116, 116, 116, 2),
                    borderRadius: BorderRadius.circular(8),
                    isSelected: isSelected,
                    children: <Widget>[
                      SizedBox(width: 180.w, child: const Text('Sign Up')),
                      SizedBox(width: 180.w, child: const Text('Sign In'))
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;buttonIndex < isSelected.length;buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return const SignUpWithEmailPage();
                            },));
                          }
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 50.h,),
                const Text('E-mail'),
                Container(margin: EdgeInsets.only(top: 10.h,bottom: 20.h),height: 50,child: TextField(controller: emailController,decoration: InputDecoration(border: OutlineInputBorder(borderSide:const BorderSide(style: BorderStyle.solid),borderRadius: BorderRadius.circular(16)),),),),
                const Text('Password'),
                Container(margin: EdgeInsets.only(top: 10.h,bottom: 10.h),height: 50,child: TextField(obscureText: true,controller: passwordController,decoration: InputDecoration(border: OutlineInputBorder(borderSide:const BorderSide(style: BorderStyle.solid),borderRadius: BorderRadius.circular(16)),),),),
                Center(child: TextButton(onPressed: (){}, child:const  Text('Forgot Password ?',style: TextStyle(color: Colors.grey,decoration: TextDecoration.underline),))),
                 SizedBox(height: 200.h,),
                 SizedBox(height: 50.h,width: double.infinity,child: ElevatedButton(onPressed: (){
                     if(auth.currentUser==null){
                     userProvider.signInWithEmailAndPassword(emailController.text, passwordController.text, context);
                    Future.delayed(const Duration(seconds: 2),(){
                    Navigator.pushReplacementNamed(context, '/usersDetailPage');
                    });
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please sign out before sign in')));
                   }
                 }, child: const Text('Continue'),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
