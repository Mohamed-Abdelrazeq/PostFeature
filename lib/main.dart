import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ronaklesson/Controllers/LocationController.dart';
import 'package:ronaklesson/Views/HomePage.dart';
import 'Views/AddPostPage.dart';
import 'Views/RegisterationPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(create: (_) => LocationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        routes: {
          "/AddPostPage": (context) => AddPostPage(),
          "/HomePage": (context) => HomePage(),
        },
        home: RegistrationPage(),
      ),
    );
  }
}
