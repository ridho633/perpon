import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/components/spacing.dart';
import '../components/size_text.dart';
import '../widgets/rounded_button.dart';
import 'auth/login_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: SafeArea(
            child: Scaffold(
        body:
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
                children: [
                  Image.asset(
                    "assets/images/das.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    scale: 1,
                  ),
                  SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Perpon",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      fontSize: SizeText.bigText,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Spacing.smallPadding),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "(Perpustakaan Online)",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      fontSize: SizeText.bigText,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context)
                              .size
                              .width * .6,
                            child: RoundedButton(
                              text: "Mulai",
                              fontSize: 20,
                              press: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
            )
        )
    )));
  }
}