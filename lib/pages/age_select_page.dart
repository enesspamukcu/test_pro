import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/provider/user_provider.dart';
import 'package:test_pro/widgets/next_button.dart';

class AgeSelectPage extends StatefulWidget {
  const AgeSelectPage({Key? key}) : super(key: key);

  @override
  State<AgeSelectPage> createState() => _AgeSelectPageState();
}

class _AgeSelectPageState extends State<AgeSelectPage> {
  late int _selectedValue=1;
  @override
  Widget build(BuildContext context) {
   final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
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
                const Text('How old are you?',style: TextStyle(fontSize: 24),),
                SizedBox(height: 80.h,),
                SizedBox(
                  height: 250.h,
                  child: Center(
                    child: CupertinoPicker.builder(
                      magnification: 1.2,
                      selectionOverlay:const CupertinoPickerDefaultSelectionOverlay(
                        background: Colors.transparent,
                      ),
                        childCount: 100,
                        itemExtent: 50.h,
                        onSelectedItemChanged: (value) {
                          _selectedValue = value;
                        },
                        itemBuilder: (context, index) {
                          return Text(index.toString());
                        }),
                  ),
                ),
                SizedBox(height: 20.h,),
                NextButton(text: 'Continue',onPress: (){
                  userProvider.createdUser.age=_selectedValue;
                  Navigator.pushNamed(context, '/heightSelectPage');
                },),
                DotsIndicator(dotsCount: 4,position: 1,),
              ]),
        ));
  }
}
