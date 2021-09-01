import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ronaklesson/Controllers/LocationController.dart';
import 'package:ronaklesson/Sevices/Auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Provider.of<LocationProvider>(context,listen: false).getLocation(),
        builder : (BuildContext context, AsyncSnapshot<void> snapshot) {
          return Container(
            width: 360.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
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
                  controller: _phone,
                  autofocus: false,
                  style: TextStyle(color: Colors.black87, fontSize: 18.sp),
                  decoration: InputDecoration(
                    hintText: "enter your phone",
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
                          Navigator.pushReplacementNamed(context, "/HomePage");
                        }else{
                          print("Failed");
                        }
                      },
                      child: Text(
                        "Register",
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
          );
        }
      ),
    );
  }
}
