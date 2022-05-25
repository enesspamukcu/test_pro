import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
   const NextButton({
    Key? key,required this.text,required this.onPress,this.color=Colors.indigo}) : super(key: key);

  final String text;
  final Function onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50.h,width: double.infinity,child: ElevatedButton(style:ElevatedButton.styleFrom(
      primary: color,
    ) ,onPressed: ()=>onPress(), child:Text(text)));
  }
}
