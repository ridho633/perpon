import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/components/shared_preferences.dart';
import 'package:perpon/screens/dashboard.dart';
import 'package:perpon/screens/welcome_screen.dart';

import '../components/color.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  bool isLogin = false;

  @override
  void initState() {
    checkLogin();
    Timer(const Duration(seconds: 5), () {
      if(!isLogin){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    });
    super.initState();
  }

  checkLogin() async {
    isLogin = await checkLoggedInUser();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sc.png'),
                  fit: BoxFit.fill)
                ),
              )
          ),
        ),
      ),
    );
  }
}