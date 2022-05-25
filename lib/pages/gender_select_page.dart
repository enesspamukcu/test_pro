import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/provider/user_provider.dart';
import 'package:test_pro/widgets/gender_icons_row.dart';
import 'package:test_pro/widgets/next_button.dart';

class GenderSelectPage extends StatefulWidget {
   const GenderSelectPage({Key? key}) : super(key: key);
  @override
  State<GenderSelectPage> createState() => _GenderSelectPageState();
}

class _GenderSelectPageState extends State<GenderSelectPage> {
  @override
  Widget build(BuildContext context) {
   Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.h,),
              const Text('What is your sex?',style: TextStyle(fontSize: 24),),
              SizedBox(height: 100.h,),
              GenderIconsRow(),
              SizedBox(height: 110.h,),
              NextButton(text: 'Continue',onPress: (){
                Navigator.pushNamed(context,'/ageSelectPage');
              },),
              DotsIndicator(dotsCount: 4,position: 0,)
            ],
          ),
        ));
  }
}



