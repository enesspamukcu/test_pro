import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtonRow extends StatelessWidget {
  const LoginButtonRow({Key? key,required this.iconData,required this.loginText}) : super(key: key);
  final String loginText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(width: 10.w),
        Text(loginText)
      ],
    );
  }
}