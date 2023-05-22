import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/models/data_models/riwayat.dart';
import 'package:perpon/screens/tampilan_riwayat.dart';
import '../components/ApiUrl.dart';
import '../components/size_text.dart';
import 'package:http/http.dart' as http;
import '../components/spacing.dart';
import '../components/color.dart';
import '../widgets/bottom_nav_bar_fb2.dart';
import 'package:perpon/components/shared_preferences.dart';

class Riwayat_buku extends StatefulWidget {
  const Riwayat_buku({Key? key}) : super(key: key);

  @override
  State<Riwayat_buku> createState() => _Riwayat_buku();
}

class _Riwayat_buku extends State<Riwayat_buku> {
  @override
  List<Riwayat> DataRiwayatMenunggu = [];
  int? idMahasiswa;

  getUserId() async {
    var id = '';
    id = await getLocalData('id_mahasiswa');
    idMahasiswa = int.parse(id);
    print('idMahasiswa: $idMahasiswa');
  }

  void initState() {
    getUserId();
    getData();
    super.initState();
    // fetchRiwayatMenunggu();
  }

  getData() async {
    DataRiwayatMenunggu = await fetchRiwayatMenunggu();
  }

  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Scaffold(
                bottomNavigationBar: const BottomNavBarFb2(selected: '3'),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/das.png'),
                          fit: BoxFit.fill)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ...DataRiwayatMenunggu.map((riwayat) {
                        //   return Tampilan_riwayat_buku(detailRiwayat: riwayat);
                        // })
                      ],
                    ),
                  ),

            //         Expanded(
            //     child: SingleChildScrollView(
            //     child: Column(
            //     children: [
            //         header(),
            //   Container(
            //     height: 50,
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     child: buttonMenu(),
            //   ),
            //   SizedBox(height: Spacing.largePadding),
            //   // TampilanBuku(),
            //   SizedBox(height: Spacing.largePadding),
            //   ],
            // ))),
                ))));
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
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                ),
              ),
            ),
          ),
          Text('Riwayat Buku',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeText.largeText,
                    fontFamily: 'Poppins',
                  )),
          // Positioned(
          //   right: 10,
          //   child: Padding(
          //     padding: EdgeInsets.all(Spacing.smallPadding),
          //     child: GestureDetector(
          //       onTap: () => Navigator.pop(context),
          //       child: const Icon(Icons.chat_rounded, color: primaryColor),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buttonMenu() {
    return ListView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      children: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize:
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                padding: EdgeInsets.symmetric(
                    vertical: Spacing.mediumPadding,
                    horizontal: Spacing.mediumPadding),
                primary: Colors.white,
                onPrimary: Colors.grey.shade400,
                side: const BorderSide(color: Colors.black, width: 1),
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              'Menunggu',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.smallText,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            )),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize:
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                padding: EdgeInsets.symmetric(
                    vertical: Spacing.mediumPadding,
                    horizontal: Spacing.mediumPadding),
                primary: Colors.white,
                onPrimary: Colors.grey.shade400,
                side: const BorderSide(color: Colors.black, width: 1),
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              'Setujui Peminjaman',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.smallText,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            )),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize:
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                padding: EdgeInsets.symmetric(
                    vertical: Spacing.mediumPadding,
                    horizontal: Spacing.mediumPadding),
                primary: Colors.white,
                onPrimary: Colors.grey.shade400,
                side: const BorderSide(color: Colors.black, width: 1),
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              'Peminjaman',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.smallText,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            )),
      ],
    );
  }

  Future<List<Riwayat>> fetchRiwayatMenunggu()
  async {
    try {
      print('masuk');
      http.Response response = await http.post(Uri.parse('http://192.168.1.74/perpon/RestApi/ApiRiwayat/Menunggu'),
      body:{
        'id_mahasiswa':idMahasiswa,
      });

      if (response.statusCode == 200) {
        print(response.body);
        DataRiwayatMenunggu.clear();
        var json = jsonDecode(response.body);
        print(json);
        for (var i = 0; i < json.length; i++) {
          setState(() {
            // DataRiwayatMenunggu.add(json[i]);
            Riwayat riwayat = Riwayat.fromJson(json[i]);
            DataRiwayatMenunggu.add(riwayat);
          });
        }
        // debugPrint(DataRiwayatMenunggu[0].toString());
        // debugPrint(DataRiwayatMenunggu.toString());
        return DataRiwayatMenunggu;
      } else {
        throw Exception('Failed to load');
      }
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
  }

  List<String> parseKatalogData(String responseBody) {
    final parsed = List<String>.from(json.decode(responseBody));
    return parsed;
  }
}
