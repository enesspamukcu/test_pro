import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/provider/user_provider.dart';
import 'package:test_pro/widgets/next_button.dart';

class HeightSelectPage extends StatefulWidget {
  const HeightSelectPage({Key? key}) : super(key: key);

  @override
  State<HeightSelectPage> createState() => _HeightSelectPageState();
}

class _HeightSelectPageState extends State<HeightSelectPage> {
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
                const Text('How much is your length? (cm)',style: TextStyle(fontSize: 24),),
                SizedBox(height: 80.h,),
                SizedBox(
                  height: 250.h,
                  child: Center(
                    child: CupertinoPicker.builder(
                      scrollController: FixedExtentScrollController(
                        initialItem: 120
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
                  userProvider.createdUser.height=_selectedValue;
                  Navigator.pushNamed(context, '/weightSelectPage');
                }),
                DotsIndicator(dotsCount: 4,position: 2,),
              ]),
        ));
  }
}