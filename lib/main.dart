import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ronaklesson/Views/FeedPage.dart';
import 'Views/AddPostPage.dart';
import 'Views/RegisterationPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        routes: {
          "/FeedPage" : (context) => FeedPage(),
          "/AddPostPage" : (context) => AddPostPage(),

        },
        home: RegistrationPage(),
      ),
    );
  }
}

