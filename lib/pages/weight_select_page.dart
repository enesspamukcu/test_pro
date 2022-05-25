import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/pages/user_detail_page.dart';
import 'package:test_pro/provider/user_provider.dart';

import '../widgets/next_button.dart';

class WeightSelectPage extends StatefulWidget {
  const WeightSelectPage({Key? key}) : super(key: key);

  @override
  State<WeightSelectPage> createState() => _WeightSelectPageState();
}

class _WeightSelectPageState extends State<WeightSelectPage> {
    int _selectedValue=1 ;
    late FirebaseAuth firebaseAuth;

    @override
  void initState() {
    super.initState();
    firebaseAuth = FirebaseAuth.instance;
  }
  @override
  Widget build(BuildContext context) {
     final userProvider = Provider.of<UserProvider>(context);
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text('How much is your weight? (kg)',style: TextStyle(fontSize: 24),),
                SizedBox(height: 80.h,),
                SizedBox(
                  height: 250.h,
                  child: Center(
                    child: CupertinoPicker.builder(
                      scrollController: FixedExtentScrollController(
                        initialItem: 60
                      ),
                      magnification: 1.2,
                      selectionOverlay:const CupertinoPickerDefaultSelectionOverlay(
                        background: Colors.transparent,
                      ),
                        childCount: 200,
                        itemExtent: 50,
                        onSelectedItemChanged: (value) {
                          setState(() {
                          _selectedValue = value;  
                          });
                        },
                        itemBuilder: (context, index) {
                          return Text(index.toString());
                        }),
                  ),
                ),
                SizedBox(height: 20.h,),
                NextButton(text: 'Continue',onPress: (){
                  var createdUser = userProvider.createdUser;
                  userProvider.createdUser.weight=_selectedValue;
                  userProvider.addUserInfo(createdUser);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserDetailPage()));
                }),
                DotsIndicator(dotsCount: 4,position: 3,),
              ]),
        ));
  }
}