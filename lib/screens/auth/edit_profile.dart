import 'package:flutter/material.dart';
import 'package:perpon/components/color.dart';
import 'package:perpon/components/size_text.dart';
import 'package:perpon/components/spacing.dart';
import 'package:perpon/widgets/custom_auth_input_2.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? val;
  bool maleRadBtnSelected = false;
  bool femaleRadBtnSelected = true;
  bool isLoading = true;
  String idUser = '';
  String? gender;
  String prodi = '';
  String requiredErrorMessage = '';

  final TextEditingController _nim = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
  final TextEditingController _prodi = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/das.png'),
                    fit: BoxFit.fill)),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    header(),
                    SizedBox(height: Spacing.mediumPadding),
                    mainForm(),
                    SizedBox(height: Spacing.largePadding),
                    ElevatedButton(
                        onPressed: () async {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width * 0.7),
                            primary: babyColor,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.all(Spacing.mediumPadding),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Text(
                          'SIMPAN PERUBAHAN',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: SizeText.averageText,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        )),
                    SizedBox(height: Spacing.bigPadding),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: Spacing.bigPadding),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 10,
            child: Padding(
              padding: EdgeInsets.all(Spacing.smallPadding),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(Spacing.backButtonPadding),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                ),
              ),
            ),
          ),
          Text('Edit Profil',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeText.bigText,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  )),
        ],
      ),
    );
  }

  Widget mainForm() {
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width < 400)
                    ? Spacing.largePadding
                    : Spacing.extraLargePadding),
            child: Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('NIM',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: SizeText.averageText,
                          ))),
              SizedBox(height: Spacing.smallPadding),
              CustomAuthInput2(
                controller: _nim,
                action: TextInputAction.next,
                hintText: 'Masukan NIM Anda',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM Wajib Diisi!';
                  } else if (value.length != 9) {
                    return 'Harap Isi NIM Dengan Benar';
                  }
                  return null;
                },
              ),
              SizedBox(height: Spacing.mediumPadding),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Nama',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: SizeText.averageText,
                          ))),
              SizedBox(height: Spacing.smallPadding),
              CustomAuthInput2(
                controller: _nama,
                action: TextInputAction.next,
                hintText: 'Masukan Nama Lengkap Anda',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Wajib Diisi!';
                  }
                  return null;
                },
              ),
              SizedBox(height: Spacing.mediumPadding),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: SizeText.averageText,
                          ))),
              SizedBox(height: Spacing.smallPadding),
              CustomAuthInput2(
                controller: _email,
                action: TextInputAction.next,
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Wajib Diisi!';
                  }
                  return null;
                },
              ),
              SizedBox(height: Spacing.mediumPadding),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('No HP',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: SizeText.averageText))),
              SizedBox(height: Spacing.smallPadding),
              CustomAuthInput2(
                controller: _notelp,
                action: TextInputAction.next,
                hintText: 'Masukan No HP Anda',
                keyboard: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kolom Nomor Telepon Wajib Diisi!';
                  }
                  return null;
                },
              ),
              SizedBox(height: Spacing.mediumPadding),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.symmetric(vertical: Spacing.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jenis Kelamin", style: TextStyle(fontSize: 18)),
                    RadioListTile(
                      title: Text("Laki-Laki"),
                      value: "L",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Perempuan"),
                      value: "P",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.symmetric(vertical: Spacing.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Prodi", style: TextStyle(fontSize: 18)),
                    RadioListTile(
                      title: Text("Manajemen Informatika"),
                      value: "Mif",
                      groupValue: prodi,
                      onChanged: (value) {
                        setState(() {
                          prodi = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Teknik Informatika"),
                      value: "Tif",
                      groupValue: prodi,
                      onChanged: (value) {
                        setState(() {
                          prodi = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Teknik Komputer"),
                      value: "Tkk",
                      groupValue: prodi,
                      onChanged: (value) {
                        setState(() {
                          prodi = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Spacing.mediumPadding),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Password',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: SizeText.averageText,
                          ))),
              SizedBox(height: Spacing.smallPadding),
              CustomAuthInput2(
                isPassword: true,
                controller: _password,
                action: TextInputAction.next,
                hintText: 'Masukan Password Anda',
                keyboard: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM Wajib Diisi!';
                  } else if (value.length < 8) {
                    return 'Password Minimal 8 Karakter';
                  } else if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Password Harus memiliki huruf besar';
                  } else if (!value.contains(RegExp(r'[0-9]'))) {
                    return 'Password Kata sandi harus memiliki angka';
                  } else if (!value.contains(RegExp(r'[a-z]'))) {
                    return 'Password Harus Ada Huruf kecil';
                  } else if (!value.contains(RegExp(r'[#?!@._*-]'))) {
                    return 'Password Harus Memiliki Simbol #?!@._* atau -';
                  }
                  return null;
                },
              ),
              SizedBox(height: Spacing.mediumPadding),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Konfirmasi Password',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: SizeText.averageText,
                          ))),
              SizedBox(height: Spacing.smallPadding),
              CustomAuthInput2(
                isPassword: true,
                controller: _password2,
                action: TextInputAction.next,
                hintText: 'Masukan Ulang Password Anda',
                keyboard: TextInputType.text,
                validator: (value) {
                  if (value != _password.text) {
                    return 'Kolom Kode Praktek Wajib Diisi!';
                  }
                  return null;
                },
              )
            ])));
  }
}
