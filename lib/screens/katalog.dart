import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perpon/screens/read_screen.dart';
import '../../components/color.dart';
import '../../components/size_text.dart';
import '../../components/spacing.dart';
import '../../widgets/bottom_nav_bar_fb2.dart';
import '../components/ApiUrl.dart';
import '../widgets/dialog_exit.dart';
import '../widgets/katalog_reading.dart';
import 'details_screen.dart';

class Katalog extends StatefulWidget {
  const Katalog({Key? key}) : super(key: key);

  @override
  State<Katalog> createState() => _Katalog();
}

class _Katalog extends State<Katalog> {
  @override

  List<dynamic> DataKatalog = [];

  void initState() {
    super.initState();
    fetchKatalogData();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
            bottomNavigationBar: BottomNavBarFb2(selected: '2',),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.25,
                    expand: false,
                    builder: (context, controller) => SingleChildScrollView(
                      controller: controller,
                      child: filterModalSheet(),
                    ));
              });
        },
        backgroundColor: babyColor,
        child: const Icon(Icons.filter_alt_rounded, color: Colors.white),
      ),
      body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: babyColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Spacing.mediumPadding,
                              vertical: Spacing.smallPadding),
                          child: TextField(
                              onChanged: (keyword) {
                                setState(() {});
                              },
                              cursorColor: primaryColor,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SvgPicture.asset('search-3.svg',
                                        color: Colors.black.withOpacity(0.4)),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: Spacing.largePadding),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Cari Obat...',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                      fontSize: SizeText.smallText,
                                      color: Colors.black.withOpacity(0.4),
                                      fontWeight: FontWeight.w500))),
                        ),
                      ),
                      SizedBox(height: Spacing.extraSmallPadding),
                      Expanded(
                        child: SingleChildScrollView(
                          child:
                        RefreshIndicator(
                            color: primaryColor,
                            onRefresh: () {
                              return Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      fetchKatalogData();
                                    });
                                  }
                                  );
                              },
                          child: Wrap(
                            spacing: Spacing.mediumPadding,
                            runSpacing: Spacing.mediumPadding,
                            alignment: WrapAlignment.center,
                            children: [
                              ...DataKatalog.map((e) {
                        return Katalog_Reading(
                              image: "assets/images/book-1.png",
                              title: e['judul_buku'],
                              auth: e['penulis_buku'],
                              rating: 4.9,
                              pressDetails: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                      return DetailsScreen(idKatalog: e['id_katalog'], judul_katalog: e['judul_buku'], keterangan_buku: e['keterangan_buku'],);
                                    },
                                  ),
                                );
                              },
                              pressRead: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ReadScreen();
                                    },
                                  ),
                                );
                              },
                            );
                              })
                            ],
                          )
                            ),
                      )
                      )],
                  ),
                ],
              )
          )
      ),
    )
          );
  }

  filterModalSheet() {
    bool filter1Clicked = false;
    bool filter2Clicked = false;
    bool filter3Clicked = false;
    bool filter4Clicked = false;

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setStateModal) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.smallPadding),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black38),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Spacing.mediumPadding,
                  vertical: Spacing.smallPadding),
              child: Text('Filter',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.bigText,
                      fontWeight: FontWeight.w900,
                      color: Colors.black))),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.mediumPadding,
                vertical: Spacing.smallPadding),
            child: Text(
              'Urutkan :',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: SizeText.mediumText,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.mediumPadding,
                vertical: Spacing.smallPadding),
            // color: yellowColor,
            child: Wrap(
              spacing: Spacing.mediumPadding,
              runSpacing: Spacing.mediumPadding,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Spacing.mediumPadding,
                            vertical: Spacing.smallPadding),
                        decoration: BoxDecoration(
                          color: (filter1Clicked == false)
                              ? Colors.white
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: babyColor),
                        ),
                        child: Text(
                          'A-Z',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: SizeText.mediumText,
                                  fontWeight: FontWeight.w600,
                                  color: (filter1Clicked == false)
                                      ? Colors.black87
                                      : primaryColor),
                        ))),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Spacing.mediumPadding,
                            vertical: Spacing.smallPadding),
                        decoration: BoxDecoration(
                          color: (filter2Clicked == false)
                              ? Colors.white
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: babyColor),
                        ),
                        child: Text(
                          'Z-A',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: SizeText.mediumText,
                                  fontWeight: FontWeight.w600,
                                  color: (filter2Clicked == false)
                                      ? Colors.black87
                                      : primaryColor),
                        ))),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Spacing.mediumPadding,
                            vertical: Spacing.smallPadding),
                        decoration: BoxDecoration(
                          color: (filter3Clicked == false)
                              ? Colors.white
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: babyColor),
                        ),
                        child: Text(
                          'Buku Terfavorit',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: SizeText.mediumText,
                                  fontWeight: FontWeight.w600,
                                  color: (filter3Clicked == false)
                                      ? Colors.black87
                                      : primaryColor),
                        ))),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Spacing.mediumPadding,
                            vertical: Spacing.smallPadding),
                        decoration: BoxDecoration(
                          color: (filter4Clicked == false)
                              ? Colors.white
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: babyColor),
                        ),
                        child: Text(
                          'Buku Terbaru',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: SizeText.mediumText,
                                  fontWeight: FontWeight.w600,
                                  color: (filter4Clicked == false)
                                      ? Colors.black87
                                      : primaryColor),
                        ))),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Spacing.mediumPadding,
                            vertical: Spacing.smallPadding),
                        decoration: BoxDecoration(
                          color: (filter4Clicked == false)
                              ? Colors.white
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: babyColor),
                        ),
                        child: Text(
                          'Buku Terlaris',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: SizeText.mediumText,
                                  fontWeight: FontWeight.w600,
                                  color: (filter4Clicked == false)
                                      ? Colors.black87
                                      : primaryColor),
                        ))),
              ],
            ),
          ),
          SizedBox(height: Spacing.mediumPadding),
        ],
      );
    });
  }

   fetchKatalogData() async {
    try {
      print('masuk');
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(Uri.parse(ApiURL+'/ApiKatalog/listkatalog'));
      if (response.statusCode == 200) {
        // print(response.body);
        DataKatalog.clear();
        var json = jsonDecode(response.body);
        for(var i = 0; i < json.length; i++){
          setState(() {
            DataKatalog.add(json[i]);
          });
        }
        debugPrint(DataKatalog[0].toString());
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
