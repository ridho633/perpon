import 'package:flutter/material.dart';
import 'package:perpon/components/spacing.dart';
import 'package:perpon/screens/auth/login_page.dart';
import 'package:perpon/screens/splash_screen.dart';
import 'package:perpon/widgets/rounded_button.dart';
import 'components/color.dart';
import 'components/size_text.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: kBlackColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
