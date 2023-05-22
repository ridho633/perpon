import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/screens/riwayat_buku.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../components/ApiUrl.dart';
import '../components/color.dart';
import '../components/size_text.dart';
import '../components/spacing.dart';
import '../widgets/custom_auth_input_2.dart';

class Peminjaman extends StatefulWidget {
  const Peminjaman({Key? key, required this.idKatalog, required this.judul_katalog }) : super(key: key);

  final String idKatalog, judul_katalog;

  @override
  State<Peminjaman> createState() => _Peminjaman();
}

class _Peminjaman extends State<Peminjaman> {
  @override

  late final String idMahasiswa;
  late final String idKatalog;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bukuController= TextEditingController();
  final TextEditingController _nimController= TextEditingController();
  final TextEditingController _prodiController= TextEditingController();
  final TextEditingController _jumblah_bukuController= TextEditingController();
  final TextEditingController _tanggal_peminjamanController= TextEditingController();
  final TextEditingController _tanggal_pengembalianController= TextEditingController();
  @override
  void initState() {
    super.initState();
    _bukuController.text = widget.judul_katalog;
    getUserData();
  }

  getUserData() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    final SharedPreferences userPrefs = await prefs;
    _nimController.text = userPrefs.getString("nim").toString();
    _nameController.text = userPrefs.getString("nama").toString();
    _prodiController.text = userPrefs.getString("prodi").toString();
    idMahasiswa = userPrefs.getString("id_mahasiswa").toString();
    idKatalog = widget.idKatalog;
  }

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
                    SizedBox(height: Spacing.bigPadding),
                    ElevatedButton(
                        onPressed: (){
                          ProsesPinjam();
                        },
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
                          'Pinjam',
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
                onTap: () =>
                    Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(Spacing.backButtonPadding),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child:
                  const Icon(Icons.arrow_back_ios_new,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          Text('Peminjaman',
              style: Theme.of(context).textTheme.headline4!.
              copyWith(
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
        child: Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Nim',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
      ),
      SizedBox(height: Spacing.smallPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: CustomAuthInput2(
          enabled: true,
          keyboard: TextInputType.name,
          action: TextInputAction.next,
          controller: _nimController,
        ),
      ),
      SizedBox(height: Spacing.mediumPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Nama',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
      ),
      SizedBox(height: Spacing.smallPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: CustomAuthInput2(
          enabled: true,
          action: TextInputAction.next,
          controller: _nameController,
        ),
      ),
      SizedBox(height: Spacing.mediumPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Buku Yang Dipinjam',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
      ),
      SizedBox(height: Spacing.smallPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: CustomAuthInput2(
          enabled: true,
          action: TextInputAction.next,
          controller: _bukuController,
        ),
      ),
      SizedBox(height: Spacing.mediumPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Prodi',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
      ),
      SizedBox(height: Spacing.smallPadding),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
        child: CustomAuthInput2(
          enabled: true,
          action: TextInputAction.next,
          controller: _prodiController,
        ),
      ),
      SizedBox(height: Spacing.mediumPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Jumblah Buku',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontFamily: 'Poppins',
                        fontSize: SizeText.averageText,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: Spacing.smallPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
                child: CustomAuthInput2(
                  enabled: true,
                  keyboard: TextInputType.number,
                  action: TextInputAction.next,
                  controller: _jumblah_bukuController,
                ),
              ),
              SizedBox(height: Spacing.mediumPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tanggal Peminjaman',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontFamily: 'Poppins',
                        fontSize: SizeText.averageText,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: Spacing.smallPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
                child: CustomAuthInput2(
                  enabled: true,
                  keyboard: TextInputType.emailAddress,
                  action: TextInputAction.next,
                  controller: _tanggal_peminjamanController,
                ),
              ),
              SizedBox(height: Spacing.mediumPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Tanggal Pengembalian',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.averageText,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: Spacing.smallPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.bigPadding),
            child: CustomAuthInput2(
              enabled: true,
              keyboard: TextInputType.emailAddress,
              action: TextInputAction.next,
              controller: _tanggal_pengembalianController,
            ),
          ),
          SizedBox(height: Spacing.mediumPadding),
            ],
          ));
  }

  ProsesPinjam() async {
    try{
      var json;
      http.Response res = await http.post(
        Uri.parse(ApiURL+'/ApiBooking/peminjaman'),
        // headers: {'Authorization': 'Bearer ' + Token!},
        body: {
          "tanggal_peminjaman": _tanggal_peminjamanController.text,
          "tanggal_pengembalian" : _tanggal_pengembalianController.text,
          "katalog_id_katalog": idKatalog,
          "mahasiswa_id_mahasiswa": idMahasiswa
        },
      );
      json = jsonDecode(res.body);
      if(res.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Peminjaman Tersimpan')));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Riwayat_buku()));
      }else{
        print("response Peminjaman :");
        print(json);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal Menambahkan Data')));
      }
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Periksa Koneksi Anda')));
    }
  }
}
