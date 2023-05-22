import 'package:flutter/material.dart';
import 'package:perpon/screens/peminjaman_buku.dart';
import 'package:perpon/screens/read_screen.dart';
import '../components/color.dart';
import '../components/size_text.dart';
import '../components/spacing.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.idKatalog, required this.judul_katalog, required this.keterangan_buku}) : super(key: key);

  final String idKatalog, judul_katalog,keterangan_buku;

  @override
  State<DetailsScreen> createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
    child:
        SafeArea(
      child:
      Scaffold(
        body: Container(
            child: Stack(children: [
      Image.asset(
        "assets/images/das.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        scale: 1,
      ),
               Expanded(
            child: SingleChildScrollView(
            child: Center(
        child:
              Column(
                  children: [
                          Container(
                          width: MediaQuery.of(context).size.width,
                        child: Stack(
                              alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        left: 10,
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                Spacing.smallPadding),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(10)
                                                ),
                                                child: IconButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  icon: const Icon(
                                                    Icons.arrow_back_ios_new,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: Spacing.extraLargePadding),
                                      Text('Detail Buku',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Spacing.bigPadding,
                                            color: Colors.black,
                                          )),
                                    ]
                        ),
                      ),
                        SizedBox(height: Spacing.mediumPadding),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.3,
                            padding: EdgeInsets.symmetric(vertical: Spacing.largePadding,
                                horizontal: Spacing.largePadding),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                              image: AssetImage("assets/images/book-1.png"),
                              fit: BoxFit.cover,
                            ),
                            ),
                        ),
                                SizedBox(height: Spacing.mediumPadding),
                                Text(widget.judul_katalog,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Spacing.bigPadding,
                                      color: Colors.black,
                                    )
                                ),
                    SizedBox(height: Spacing.mediumPadding),
                           Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.symmetric(
                                vertical: Spacing.largePadding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: greyColor,
                                width: 2
                              )
                            ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.star, color: yellowColor),
                                    Text('Rating',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                          fontFamily: 'Poppins',
                                          fontSize: SizeText.mediumText,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                    Text('150',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                          fontFamily: 'Poppins',
                                          fontSize: SizeText.mediumText,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child:
                                Column(
                                  children: [
                                    const Icon(Icons.category, color: yellowColor),
                                    Text('Kategori',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                          fontFamily: 'Poppins',
                                          fontSize: SizeText.mediumText,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                    Text('100',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                          fontFamily: 'Poppins',
                                          fontSize: SizeText.mediumText,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child:
                                Column(
                                  children: [
                                    const Icon(Icons.add_a_photo_outlined, color: yellowColor),
                                    Text('Views',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                          fontFamily: 'Poppins',
                                          fontSize: SizeText.mediumText,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                    Text('500',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                          fontFamily: 'Poppins',
                                          fontSize: SizeText.mediumText,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                           ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Text('Keterangan Buku',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontFamily: 'Poppins',
                          fontSize: SizeText.largeText,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87),
                        ),
                        SizedBox(height: Spacing.smallPadding),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: greyColor,
                                  width: 2
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(widget.keterangan_buku,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                    fontFamily: 'Poppins',
                                    fontSize: SizeText.mediumText,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                            SizedBox(height: Spacing.mediumPadding),
                            ElevatedButton(
                              onPressed:() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder:  (context) {
                                 return ReadScreen();
                                    }
                                    )
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromWidth(
                                    MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: Spacing.smallPadding),
                                  primary: Colors.black,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(25))),
                              child: Text('Lanjut Baca',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                      color: Colors.white,
                                      fontSize: SizeText.largeText,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Poppins')),
                            ),
                            SizedBox(height: Spacing.mediumPadding),
                            ElevatedButton(
                              onPressed:() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder:  (context) {
                                      return Peminjaman(idKatalog: widget.idKatalog, judul_katalog:widget.judul_katalog);
                                    }
                                    )
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromWidth(
                                    MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: Spacing.smallPadding),
                                  primary: Colors.black,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(25))),
                              child: Text('Peminjaman',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                      color: Colors.white,
                                      fontSize: SizeText.largeText,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Poppins')),
                            ),
                          ]
                          ),
                        ]),

                          )))])
              )
          )
        )
    );
  }
}
