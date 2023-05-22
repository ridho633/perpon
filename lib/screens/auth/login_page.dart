import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/models/m_auth.dart';
import 'package:perpon/screens/auth/register_page.dart';
import 'package:perpon/screens/dashboard.dart';
import '../../components/color.dart';
import '../../components/size_text.dart';
import '../../components/spacing.dart';
import '../../widgets/custom_auth_input_2.dart';
import '../../widgets/dialog_exit.dart';
import 'package:http/http.dart' as http;
import 'create_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;
  String _errorMessage = '';
  String token = "";
  bool isBiometricAvailable = false;
  bool loginFailed = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _alreadySubmitted = false;
  final MAuth _mAuth = MAuth();

  _submitLogin() async {
    print('login proses');
    if(_formKey.currentState!.validate()) {
      setState(() {
        _alreadySubmitted = true;
      });
      var register = _mAuth.userLogin(
          nim: _usernameController.text,
          password: _passwordController.text
      ).then((value) async {
        if(value['status']['status'] == 200){
          print('berhasil Login');
          //code jika berhasil
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Berhasil')));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
        }else{
          setState(() {
            _alreadySubmitted = false;
          });
          print('gagal Login');
          //code jika gagal
          showDialog(
            context: context,
            barrierDismissible: true,
            // false = user must tap button, true = tap outside dialog
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('Peringatan!'),
                content: Text(value['status']['message']),
                actions: <Widget>[
                  TextButton(
                    child: Text('Tutup'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        }
      }).onError((error, stackTrace) {
        print('error : $error');
        setState(() {
          _alreadySubmitted = false;
        });
        //code jika error
        showDialog(
          context: context,
          barrierDismissible: true,
          // false = user must tap button, true = tap outside dialog
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('Peringatan!'),
              content: Text(error.toString()),
              actions: <Widget>[
                TextButton(
                  child: Text('Tutup'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  },
                ),
              ],
            );
          },
        );
      });
    }else{
      showDialog(
        context: context,
        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Peringatan!'),
            content: Text('Harap isi data dengan benar'),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => showExitPopup(context),
      child:  Container(
        color: Colors.grey,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/das.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Expanded(
                  child:
                  SingleChildScrollView(
                    child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 50),
                                SizedBox(height: Spacing.extraLargePadding * 3),
                                Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Spacing.largePadding),
                                          child: Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text('NIM',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                        fontFamily: 'Poppins',
                                                        fontSize: SizeText.largeText,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  )
                                              ),
                                              SizedBox(height: Spacing.smallPadding),
                                              CustomAuthInput2(
                                                hintText: 'Masukkan Nim Anda',
                                                controller: _usernameController,
                                                action: TextInputAction.next,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {}
                                                  return null;
                                                },
                                              ),
                                              SizedBox( height: Spacing.largePadding),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text('Password',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                        fontFamily: 'Poppins',
                                                        fontSize: SizeText.largeText,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  )),
                                              SizedBox(height: Spacing.smallPadding),
                                              CustomAuthInput2(
                                                hintText: 'Masukkan Password Anda',
                                                controller: _passwordController,
                                                isPassword: true,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {}
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: Spacing.bigPadding,
                                                  top: Spacing.smallPadding),
                                              child: TextButton(
                                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePassword())),
                                                style: TextButton.styleFrom(
                                                    primary: blackColor,
                                                    padding: EdgeInsets.only(right: Spacing.bigPadding)),
                                                child: Text(
                                                  'Lupa Password?',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                      fontFamily: 'Poppins',
                                                      fontSize:SizeText.mediumText,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            )),
                                        SizedBox(height: Spacing.mediumPadding),
                                        ElevatedButton(
                                        onPressed: () {
                                          if(!_alreadySubmitted){
                                            _submitLogin();
                                            print('cek');
                                          }
                                        },
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size.fromWidth(
                                                MediaQuery.of(context).size.width * 0.7,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Spacing.smallPadding),
                                              primary: Colors.black,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30))),
                                          child: Text('Login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                  color: Colors.white,
                                                  fontSize: SizeText.largeText,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Poppins')),
                                        ),
                                        ElevatedButton(
                                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())) ,
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size.fromWidth(
                                                MediaQuery.of(context).size.width *
                                                    0.7,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Spacing.smallPadding),
                                              primary: Colors.black,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30))),
                                          child: Text('Daftar',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                  color: Colors.white,
                                                  fontSize: SizeText.largeText,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Poppins')),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                        )),
                  ),

            ),
          ),
        )
    );
  }
}
