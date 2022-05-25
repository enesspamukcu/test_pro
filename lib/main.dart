import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_pro/firebase_options.dart';
import 'package:test_pro/pages/landing_page.dart';
import 'package:test_pro/pages/user_detail_page.dart';
import 'package:test_pro/provider/user_provider.dart';
import 'package:test_pro/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (context) => UserProvider(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (context, child) =>
       MaterialApp(
         onGenerateRoute: RouteGenerator.routeGenerator,
         debugShowCheckedModeBanner: false,
        title: 'Test Pro',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
            iconTheme: IconThemeData(
              color: Colors.black
            )
          )
        ),
        home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> userSnapshot){
            if(userSnapshot.hasData && userSnapshot.connectionState==ConnectionState.done){
              return const UserDetailPage();
            }else{
              return const LandingPage();
            }
          },
        )
      ),
    );
  }
 
}
