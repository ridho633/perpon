import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:perpon/models/m_auth.dart';
import '../../components/size_text.dart';
import '../../components/spacing.dart';
import '../../widgets/custom_auth_input_2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState>_formKey = GlobalKey();
  String? gender;
  String? prodi;
  bool _alreadySubmitted = false;
  String requiredErrorMessage = '';
  final MAuth _mAuth = MAuth();

  final TextEditingController _nim = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
  final TextEditingController _prodi = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

  @override
  void dispose() {
    _nim.dispose();
    _nama.dispose();
    _email.dispose();
    _notelp.dispose();
    _prodi.dispose();
    _password.dispose();
    _password2.dispose();
    super.dispose();
  }

  prosesRegister() async {
    if(_formKey.currentState!.validate() && gender != '') {
      setState(() {
        _alreadySubmitted = true;
      });
    var register = _mAuth.register(
          nama: _nama.text,
          nim: _nim.text,
          prodi: _prodi.text,
          jenis_kelamin: gender as String,
          password: _password.text,
          nomor_telepon: _notelp.text,
          email: _email.text
      ).then((value) async {
        if(value['status']['status'] == 200){
          print('berhasil register');
          //code jika berhasil
          showDialog(
            context: context,
            barrierDismissible: true,
            // false = user must tap button, true = tap outside dialog
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('Register Berhasil'),
                content: Text('Silahkan Login Untuk Melanjutkan'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      Navigator.pop(context);// Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        }else{
          setState(() {
            _alreadySubmitted = false;
          });
          print('gagal register');
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
                                fit: BoxFit.fill)
                        ),
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child:
                                        Padding(
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
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              left: 60),
                                          child: Text('Pendaftaran',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: Spacing.bigPadding,
                                                color: Colors.black,
                                              )),
                                        ),
                                      )
                                    ]),
                                Form(
                                    key: _formKey,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (MediaQuery.of(context)
                                              .size
                                              .width <
                                              400)
                                              ? Spacing.largePadding
                                              : Spacing.extraLargePadding),
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
                                                    fontWeight:
                                                    FontWeight.w500,
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
                                              }else if(value.length != 9){
                                                return 'Harap Isi NIM Dengan Benar';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: Spacing.mediumPadding),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Nama',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: SizeText.averageText,
                                                  ))),
                                          SizedBox(height: Spacing.smallPadding),
                                          CustomAuthInput2(
                                            controller: _nama,
                                            action: TextInputAction.next,
                                            hintText:
                                            'Masukan Nama Lengkap Anda',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Nama Wajib Diisi!';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                              height: Spacing.mediumPadding),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Email',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: SizeText.averageText,
                                                  ))),
                                          SizedBox(height: Spacing.smallPadding),
                                          CustomAuthInput2(
                                            controller: _email,
                                            action: TextInputAction.next,
                                            hintText: 'Email',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Email Wajib Diisi!';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: Spacing.mediumPadding),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('No HP',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: SizeText.averageText))),
                                          SizedBox(height: Spacing.smallPadding),
                                          CustomAuthInput2(
                                            controller: _notelp,
                                            action: TextInputAction.next,
                                            hintText: 'Masukan No HP Anda',
                                            keyboard: TextInputType.number,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Kolom Nomor Telepon Wajib Diisi!';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: Spacing.mediumPadding),
                                          Container(
                                            margin: EdgeInsets.only(top: 0),
                                            padding: EdgeInsets.symmetric(
                                                vertical: Spacing.smallPadding),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Jenis Kelamin",
                                                  style: TextStyle(
                                                    fontSize: 18)),
                                                RadioListTile(
                                                  title: Text("Laki-Laki"),
                                                  value: "L",
                                                  groupValue: gender,
                                                  onChanged: (value){
                                                    setState(() {
                                                      gender = value.toString();
                                                    });
                                                  },
                                                ),
                                                RadioListTile(
                                                  title: Text("Perempuan"),
                                                  value: "P",
                                                  groupValue: gender,
                                                  onChanged: (value){
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: Spacing.smallPadding),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Prodi",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                RadioListTile(
                                                  title: Text("Manajemen Informatika"),
                                                  value: "Mif",
                                                  groupValue: prodi,
                                                  onChanged: (value){
                                                    setState(() {
                                                      prodi = value.toString();
                                                    });
                                                  },
                                                ),
                                                RadioListTile(
                                                  title: Text("Teknik Informatika"),
                                                  value: "Tif",
                                                  groupValue: prodi,
                                                  onChanged: (value){
                                                    setState(() {
                                                      prodi = value.toString();
                                                    });
                                                  },
                                                ),
                                                RadioListTile(
                                                  title: Text("Teknik Komputer"),
                                                  value: "Tkk",
                                                  groupValue: prodi,
                                                  onChanged: (value){
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
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize:SizeText.averageText,
                                                  ))),
                                          SizedBox(height: Spacing.smallPadding),
                                          CustomAuthInput2(
                                            controller: _password,
                                            action: TextInputAction.next,
                                            hintText: 'Masukan Password Anda',
                                            keyboard: TextInputType.text,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'NIM Wajib Diisi!';
                                              }else if(value.length < 8){
                                                return 'Password Minimal 8 Karakter';
                                              }else if(!value.contains(RegExp(r'[A-Z]'))){
                                                return 'Password Harus memiliki huruf besar';
                                              }else if(!value.contains(RegExp(r'[0-9]'))){
                                                return 'Password Kata sandi harus memiliki angka';
                                              }else if(!value.contains(RegExp(r'[a-z]'))){
                                                return 'Password Harus Ada Huruf kecil';
                                              }else if(!value.contains(RegExp(r'[#?!@._*-]'))){
                                                return 'Password Harus Memiliki Simbol #?!@._* atau -';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: Spacing.mediumPadding),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Konfirmasi Password',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize:SizeText.averageText,
                                                  ))),
                                          SizedBox(height: Spacing.smallPadding),
                                          CustomAuthInput2(
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
                                          ),
                                          SizedBox(height: Spacing.largePadding),
                                          if(_alreadySubmitted)
                                            Text('Loading'),
                                          ElevatedButton(
                                            onPressed: () {
                                              if(!_alreadySubmitted){
                                                prosesRegister();
                                                print('CEK');
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: Size.fromWidth(
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.8),
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                    Spacing.mediumPadding),
                                                primary: Colors.black,
                                                shadowColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30))),
                                            child: Text('Daftar',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize:SizeText.averageText,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontFamily: 'Poppins')),
                                          ),
                                          SizedBox(height: Spacing.mediumPadding),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ))))));
  }
}
