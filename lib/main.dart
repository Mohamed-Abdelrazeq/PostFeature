import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ronaklesson/Sevices/Auth.dart';
//
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
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: 360.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 64.sp,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: _emailController,
                autofocus: false,
                style: TextStyle(color: Colors.black87, fontSize: 18.sp),
                decoration: InputDecoration(
                  hintText: "enter your email",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: _passwordController,
                autofocus: false,
                style: TextStyle(color: Colors.black87, fontSize: 18.sp),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "enter your password",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black87),
                        // padding: MaterialStateProperty.all()
                      ),
                      onPressed: () async {
                        UserCredential userCredential = await Auth().register(
                          email: _emailController.text,
                          password: _passwordController.text
                        );
                        if(userCredential != null){
                          print("Done");
                        }else{
                          print("Failed");
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
