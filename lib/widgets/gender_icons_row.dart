import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/constants.dart';
import 'package:test_pro/provider/user_provider.dart';

class GenderIconsRow extends StatefulWidget {
  GenderIconsRow({Key? key}) : super(key: key);
   String gender='';
  @override
  State<GenderIconsRow> createState() => _GenderIconsRowState();
}
 
class _GenderIconsRowState extends State<GenderIconsRow> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120.w,
          height: 140.h,
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(
            color: Colors.grey,
            offset: Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxSh
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
          ),
          child: IconButton(onPressed: () {
            setState(() {
              widget.gender='female';
              userProvider.createdUser.gender='female';
            });
          }, icon:Icon(Icons.female,color:widget.gender=='female'?Constants.activeFemaleColor:Constants.inActiveGenderIconColor,),iconSize: 100,)),
         SizedBox(width: 20.w,),
         Container(
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(
            color: Colors.grey,
            offset: Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxSh
            ],
            borderRadius: BorderRadiusDirectional.circular(20),
            color: Colors.white,
          ),
          width: 120.w,
          height: 140.h,
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.gender= 'male';
                userProvider.createdUser.gender='male';
              });
            },
            icon:Icon(Icons.male,color:widget.gender=='male'?Constants.activeMaleColor:Constants.inActiveGenderIconColor,),
            iconSize: 100,
          ),
        ),  
      ],
    );
  }
}