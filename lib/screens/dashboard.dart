import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/screens/read_screen.dart';
import 'package:perpon/widgets/dialog_exit.dart';
import '../components/consttants.dart';
import '../components/size_text.dart';
import '../components/spacing.dart';
import '../widgets/bottom_nav_bar_fb2.dart';
import '../widgets/book_rating.dart';
import '../widgets/reading_card_list.dart';
import '../widgets/two_side_rounded_button.dart';
import 'details_screen.dart';

class Dashboard extends StatefulWidget {
const Dashboard({Key? key}) : super(key: key);

@override
State<Dashboard> createState() => _Dashboard();

}

class _Dashboard extends State<Dashboard> {
  bool searchPressed = false;
  bool isProductLoading = true;
  int pressedTabIndex = 0;
  String? errorMessage;
  bool isUserLoggedIn = false;
  String idmember = "";
  late List<String> idcategory = [""];
  late List<String> namecategory = [""];
  late List<String> imagecategory = [""];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child:  Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: const BottomNavBarFb2(selected: '1'),
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/das.png'),
                      fit: BoxFit.fill
                  )
              ),
                        child: SingleChildScrollView(
                            child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: Spacing.extraSmallPadding),
                              header(),
                              SizedBox(height: Spacing.smallPadding),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 24),
                                child: RichText(
                                  text: TextSpan(
                                    style:
                                    Theme
                                        .of(context)
                                        .textTheme
                                        .headline4,
                                    children: [
                                      TextSpan(
                                          text: 'Buku Terfavorit',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: Spacing.mediumPadding,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        child: ReadingListCard(
                                          image: "assets/images/book-1.png",
                                          title: "Crushing & Influence",
                                          auth: "Gary Venchuk",
                                          rating: 4.9,
                                          pressDetails: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailsScreen(idKatalog: "idKatalog", judul_katalog: "judul_katalog", keterangan_buku: "keterangan_buku");
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
                                        )
                                    ),
                                    ReadingListCard(
                                      image: "assets/images/book-2.png",
                                      title: "Top Ten Business Hacks",
                                      auth: "Herman Joel",
                                      rating: 4.8,
                                      pressDetails: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DetailsScreen(idKatalog: "idKatalog", judul_katalog: "judul_katalog", keterangan_buku: "keterangan_buku",);
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
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Spacing.smallPadding),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: RichText(
                                        text: TextSpan(
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .headline4,
                                          children: [
                                            TextSpan(
                                                text: 'Buku Terbaru',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(
                                                  fontWeight:
                                                  FontWeight.w800,
                                                  fontSize:
                                                  Spacing.mediumPadding,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          ReadingListCard(
                                            image: "assets/images/book-1.png",
                                            title: "Crushing & Influence",
                                            auth: "Gary Venchuk",
                                            rating: 4.9,
                                            pressDetails: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailsScreen(idKatalog: "idKatalog", judul_katalog: "judul_katalog", keterangan_buku: "keterangan_buku",);
                                                  },
                                                ),
                                              );
                                            },
                                            pressRead: () {},
                                          ),
                                          ReadingListCard(
                                            image: "assets/images/book-2.png",
                                            title: "Top Ten Business Hacks",
                                            auth: "Herman Joel",
                                            rating: 4.8,
                                            pressDetails: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailsScreen(idKatalog: "idKatalog", judul_katalog: "judul_katalog", keterangan_buku: "keterangan_buku",);
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
                                          ),
                                          SizedBox(width: 30),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Spacing.smallPadding),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: RichText(
                                            text: TextSpan(
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline4,
                                              children: [
                                                TextSpan(
                                                    text: 'Buku Terlaris',
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .headline4!
                                                        .copyWith(
                                                      fontWeight:
                                                      FontWeight.w800,
                                                      fontSize: Spacing
                                                          .mediumPadding,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: <Widget>[
                                              ReadingListCard(
                                                image:
                                                "assets/images/book-1.png",
                                                title: "Crushing & Influence",
                                                auth: "Gary Venchuk",
                                                rating: 4.9,
                                                pressDetails: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return DetailsScreen(idKatalog: "idKatalog", judul_katalog: "judul_katalog", keterangan_buku: "keterangan_buku",);
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
                                              ),
                                              ReadingListCard(
                                                image:
                                                "assets/images/book-2.png",
                                                title: "Top Ten Business Hacks",
                                                auth: "Herman Joel",
                                                rating: 4.8,
                                                pressDetails: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return DetailsScreen(idKatalog: "idKatalog", judul_katalog: "judul_katalog", keterangan_buku: "keterangan_buku",);
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
                                              ),
                                              SizedBox(width: 30),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .headline4,
                                                  children: [
                                                    TextSpan(
                                                        text: "Best of the "),
                                                    TextSpan(
                                                      text: "day",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                // ),
                                                // bestOfTheDayCard(size, context),
                                                // RichText(
                                                //   text: TextSpan(
                                                //     style: Theme.of(context).textTheme.headline4,
                                                //     children: [
                                                //       TextSpan(text: "Continue "),
                                                //       TextSpan(
                                                //         text: "reading...",
                                                //         style: TextStyle(fontWeight: FontWeight.bold),
                                                //       ),
                                                //     ],
                                                //   ),
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                height: 80,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      38.5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 10),
                                                      blurRadius: 33,
                                                      color: Color(0xFFD3D3D3)
                                                          .withOpacity(.84),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      38.5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              left: 30,
                                                              right: 20),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Crushing & Influence",
                                                                      style:
                                                                      TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "Gary Venchuk",
                                                                      style:
                                                                      TextStyle(
                                                                        color:
                                                                        kLightBlackColor,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                      child:
                                                                      Text(
                                                                        "Chapter 7 of 10",
                                                                        style:
                                                                        TextStyle(
                                                                          fontSize:
                                                                          10,
                                                                          color:
                                                                          kLightBlackColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                        5),
                                                                  ],
                                                                ),
                                                              ),
                                                              Image.asset(
                                                                "assets/images/book-1.png",
                                                                width: 55,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 7,
                                                        width: size.width * .65,
                                                        decoration:
                                                        BoxDecoration(
                                                          color:
                                                          kProgressIndicator,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(7),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ]))

                ),
              ),
            )
        ));




    // Widget headerone() {
    // return TextField(
    //     onChanged: (keyword) {},
    //     cursorColor: primaryColor,
    //     style: Theme
    //         .of(context)
    //         .textTheme
    //         .headline5!
    //         .copyWith(
    //         color: Colors.black,
    //         fontWeight: FontWeight.w400),
    //     decoration: InputDecoration(
    //         fillColor: Colors.white,
    //         filled: true,
    //         prefixIcon: Padding(
    //           padding: const EdgeInsets.all(16),
    //           child: SvgPicture.asset(
    //               'assets/icons/search-3.svg',
    //               color: Colors.black.withOpacity(0.4)),
    //         ),
    //         contentPadding: EdgeInsets.only(
    //             left: Spacing.largePadding),
    //         focusedBorder: const OutlineInputBorder(
    //             borderSide: BorderSide.none),
    //         enabledBorder: const OutlineInputBorder(
    //             borderSide: BorderSide.none),
    //         errorBorder: const OutlineInputBorder(
    //             borderSide: BorderSide.none),
    //         focusedErrorBorder: const OutlineInputBorder(
    //             borderSide: BorderSide.none),
    //         hintText: 'Cari Buku...',
    //         hintStyle: Theme
    //             .of(context)
    //             .textTheme
    //             .headline5!
    //             .copyWith(
    //             fontSize: SizeText.smallText,
    //             color: Colors.black.withOpacity(0.4),
    //             fontWeight: FontWeight.w500))
    // );
    }

    Widget header() {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.all(Spacing.smallPadding),
        decoration: BoxDecoration(
            color: Colors.transparent
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: const Icon(Icons.person,
                  color: Colors.black,)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: Spacing.bigPadding,
                    child: Center(
                      child: Text("Selamat Datang di RUANG BACA",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6!
                            .copyWith(
                            fontFamily: 'Poppins',
                            fontSize: SizeText.mediumText,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                        ),
                      ),
                    )
                ),
                SizedBox(height: Spacing.bigPadding,
                    child: Center(
                      child: Text("JURUSAN TEKNOLOGI INFORMASI",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6!
                            .copyWith(
                            fontFamily: 'Poppins',
                            fontSize: SizeText.mediumText,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                        ),
                      ),
                    )
                ),
                SizedBox(height: Spacing.bigPadding,
                    child: Center(
                      child: Text("Hai Ridho Adilah Wasisto",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6!
                            .copyWith(
                            fontFamily: 'Poppins',
                            fontSize: SizeText.mediumText,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                        ),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  Container bestOfTheDayCard(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 245,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 24,
                right: size.width * .35,
              ),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "New York Time Best For 11th March 2020",
                      style: TextStyle(
                        fontSize: 9,
                        color: kLightBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    "How To Win \nFriends &  Influence",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  ),
                  Text(
                    "Gary Venchuk",
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: BookRating(score: 4.9),
                        ),
                        Expanded(
                          child: Text(
                            "When the earth was flat and everyone wanted to win the game of the best and people….",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: kLightBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/images/book-3.png",
              width: size.width * .37,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSideRoundedButton(
                text: "Read",
                radious: 24,
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }


