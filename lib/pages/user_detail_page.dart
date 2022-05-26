import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/api/firebase_api.dart';
import 'package:test_pro/constants.dart';
import 'package:test_pro/provider/user_provider.dart';
import 'package:test_pro/widgets/next_button.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children:[
            FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
              future: FirebaseApi.readUsersInfo(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: [
                    Center(
                    child: Image.asset('assets/images/exercise.png',width: 150.w,height: 150.h,),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text('Name : ',style:Constants.userDetailPageTitle,),
                    Text(snapshot.data!.data()?['name']??'Null',style: Constants.userDetailPageText,),
                  ],),
                   const Divider(thickness: 0.8,color: Colors.black,),
                     SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text('Gender : ',style: Constants.userDetailPageTitle,),
                    Text(snapshot.data!.data()?['gender']??'Null',style: Constants.userDetailPageText,),
                  ],),
                  const Divider(thickness: 0.8,color: Colors.black,),
                    SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text('Age : ',style: Constants.userDetailPageTitle,),
                    Text(snapshot.data!.data()?['age'].toString()??'null',style: Constants.userDetailPageText,),
                  ],),
                  const  Divider(thickness: 0.8,color: Colors.black,),
                     SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text('Weight : ',style: Constants.userDetailPageTitle,),
                    Text(snapshot.data!.data()?['weight'].toString()??'null',style: Constants.userDetailPageText,),
                  ],),
                   const Divider(thickness: 0.8,color: Colors.black,),
                     SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                    Text('Height : ',style: Constants.userDetailPageTitle,),
                    Text(snapshot.data!.data()?['height'].toString()??'null',style: Constants.userDetailPageText,),
                  ],),
                   const Divider(thickness: 0.8,color: Colors.black,)
              ],
                  );
                }else{
                  return const CircularProgressIndicator();
                }
              }),
            SizedBox(height: 20.h,),
            NextButton(color: Colors.red,text: 'Sign Out!', onPress: ()async{
              await GoogleSignIn().signOut();
               userProvider.signOutUser();
                Future.delayed(const Duration(seconds: 1),(){
                  Navigator.popAndPushNamed(context,'/landingPage');
                });
            }),
            SizedBox(height: 20.h,),
            NextButton(text: 'Update My Information', onPress: ()=>Navigator.popAndPushNamed(context, '/namePage'))
          ]
        ),
      ) 
    );
  }
}