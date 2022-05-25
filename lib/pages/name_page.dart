import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/provider/user_provider.dart';

class NamePage extends StatelessWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0.w),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Your Name?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
               TextFormField(
                controller: textEditingController,
                validator: (value) => value!.length<=2?'Your name must be longer than 2 character':'',
                decoration: const InputDecoration(hintText: 'Your Name'),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        userProvider.createdUser.name=textEditingController.text;
                        userProvider.createdUser.id=FirebaseAuth.instance.currentUser!.uid;
                        Navigator.pushNamed(context, '/genderSelectPage');
                      }, child: const Text('Continue'))),
            ],
          ),
        ),
      ),
    );
  }
}
