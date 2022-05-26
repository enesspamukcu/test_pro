import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/constants.dart';
import 'package:test_pro/pages/sign_in_email_page.dart';
import 'package:test_pro/provider/user_provider.dart';

class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({Key? key}) : super(key: key);

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerCreatePassword =TextEditingController();
  TextEditingController textEditingControllerRePassword =TextEditingController();
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  List<bool> isSelected = [true, false];
 
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    formControl();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
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
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] = true;
                            } else {
                              isSelected[buttonIndex] = false;
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const SignInEmailPage();
                                },
                              ));
                            }
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 50.h,),
                const Text('E-mail'),
                Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                     controller: textEditingControllerEmail,
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Please Enter Password';
                        }else{
                        if(!EmailValidator.validate(value)){
                          return 'Invalid E-mail address';
                        }{
                          return null;
                        }
                      }},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    )),
                const Text('Create Password'),
                Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                    height: 50,
                    child: TextFormField(
                      obscureText: true,
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }else {
                          if (!regex.hasMatch(value)) {
                           return 'Enter valid password';
                        }else{
                          return null;
                        }}
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: textEditingControllerCreatePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    )),
                const Text('Re-write Password'),
                Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {
                          setState(() { });
                      },
                      validator: (value) {
                        if(value==textEditingControllerCreatePassword.text){
                          return null;
                        }else{
                          return 'Password entered are not equal';
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: textEditingControllerRePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    )),
                SizedBox(
                  height: 160.h,
                ),
                SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: formControl(),
                        onPressed: () async{
                          if(auth.currentUser==null){
                             await userProvider.createUserWithEmailAndPassword(textEditingControllerEmail.text,textEditingControllerCreatePassword.text,context);
                            Future.delayed(const Duration(seconds:1),(){
                              auth.currentUser!=null?Navigator.pushReplacementNamed(context,'/namePage'):ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something is went wrong!')));
                            });
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please sign out before sign up')));
                          }
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                          }
                        }, child: const Text('Continue')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle formControl() {
    bool? validate = formKey.currentState?.validate();
    return validate==true?Constants.loginButtonActive:Constants.loginButtonInActive;
  }
}
