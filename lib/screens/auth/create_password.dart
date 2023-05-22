import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../components/color.dart';
import '../../components/size_text.dart';
import '../../components/spacing.dart';
import '../../widgets/custom_auth_input_2.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isUserLoggedIn = false;
  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                            alignment: Alignment.center,
                            children: [
                        Row(
                        children: [
                        Align(
                        alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                            EdgeInsets.all(Spacing.mediumPadding),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              child: IconButton(
                                onPressed: () =>
                                    Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                              SizedBox(height: Spacing.extraLargePadding),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5,
                                        left: 60),
                              child: Text('Buat Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: SizeText.bigText,
                                    color: Colors.black,
                                  )),
                                ))]),
                      ]),
        ),
                      SizedBox(height: Spacing.largePadding),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(
                              'Masukan Alamat Email Yang Anda Gunakan untuk Mendaftar',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: SizeText.largeText,
                                    color: Colors.black,
                                  )
                          )
                      ),
                      SizedBox(height: Spacing.largePadding),
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
                                    child: Text('Email',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                          fontSize: SizeText.averageText,
                                          fontFamily: 'Poppins',
                                        )),
                                  ),
                                  SizedBox(height: Spacing.smallPadding),
                                  CustomAuthInput2(
                                    hintText: 'Masukan Alamat email',
                                    controller: _email,
                                    action: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Kolom Alamat Email Masih Kosong!';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: Spacing.mediumPadding),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontFamily: 'Poppins',
                                              fontSize: SizeText.averageText,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87),
                                    ),
                                  ),
                                  SizedBox(height: Spacing.smallPadding),
                                  CustomAuthInput2(
                                    hintText: 'Masukkan Password Baru',
                                    controller: _newPassController,
                                    isPassword: true,
                                    action: TextInputAction.done,
                                    autoValidate:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap masukkan password baru anda';
                                      } else if (value.length < 8) {
                                        return 'Password minimal 8 karakter';
                                      }
                                    },
                                  ),
                                  SizedBox(height: Spacing.mediumPadding),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Konfirmasi Password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontFamily: 'Poppins',
                                              fontSize: SizeText.averageText,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87),
                                    ),
                                  ),
                                  SizedBox(height: Spacing.smallPadding),
                                  CustomAuthInput2(
                                    hintText: 'Ketik Ulang Password',
                                    controller: _confirmPassController,
                                    isPassword: true,
                                    action: TextInputAction.done,
                                    autoValidate:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap ketik ulang password baru anda';
                                      } else if (value.length < 8) {
                                        return 'Password minimal 8 karakter';
                                      } else if (value !=
                                          _newPassController.text) {
                                        return 'Konfirmasi Password harus sama';
                                      }
                                    },
                                  ),
                                  SizedBox(height: Spacing.extraLargePadding),
                                  ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size.fromWidth(
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: Spacing.mediumPadding),
                                        primary: Colors.black,
                                        shadowColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    child: Text('Buat Password',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: SizeText.averageText,
                                              fontWeight: FontWeight.w600,
                                            )),
                                  ),
                                ]),
                              )
                            ],
                          ))
                    ],
                  )))
      )))));
  }
}
