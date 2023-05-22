import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/screens/auth/edit_profile.dart';
import 'package:perpon/screens/auth/login_page.dart';
import 'package:perpon/widgets/bottom_nav_bar_fb2.dart';
import 'package:perpon/widgets/custom_option_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/color.dart';
import '../../components/size_text.dart';
import '../../components/spacing.dart';
import '../../widgets/dialog_exit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isUserLoggedIn = false;
  String idmember = "";
  String username = "";
  String name = "";
  String alamat = "";
  String email = "";
  String noTelp = "";
  String idKategori = "";
  String fotoUser = "";
  String jmlTransaksi = "";
  String jumlahPoin = "";
  bool isLoading = false;
  String errorMessage = '';
  bool isOnline = false;


Widget build(BuildContext context) {
  return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        color: Colors.grey,
        child: SafeArea(
          child: Scaffold(
            bottomNavigationBar: const BottomNavBarFb2(selected: '4'),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      header(),
                      SizedBox(height: Spacing.largePadding),
                      userProfileInfo(),
                      SizedBox(height: Spacing.mediumPadding),
                      mainContent(),
                      // const Spacer(),
                      SizedBox(height: Spacing.extraLargePadding * 4),
                      ElevatedButton(
                        onPressed:() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomOptionDialog(
                                title: 'Yakin ingin keluar?',
                                actionButton: const ['Batal', 'Ya, Logout'],
                                isYesButtonPressed: () async {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  SharedPreferences userPrefs = await SharedPreferences.getInstance();
                                  userPrefs.clear();
                                  userPrefs.setBool('status_login', false);
                                },
                                isNoButtonPressed: () => Navigator.pop(context),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.5),
                            primary: Colors.red,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(Spacing.mediumPadding),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            )
                        ),
                        child: Text('LOGOUT',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                              fontFamily: 'Poppins',
                              fontSize: SizeText.averageText,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(height: Spacing.mediumPadding),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
  );
}

  Widget header(){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1))
      ),
      padding: EdgeInsets.symmetric(vertical: Spacing.bigPadding),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Text('Profil',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(
                fontWeight: FontWeight.w700,
                fontSize: SizeText.largeText,
                fontFamily: 'Poppins',)
          ),
        ],
      ),
    );
  }

  Widget userProfileInfo(){
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          // color: yellowColor,
          child: Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: pinkColor
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                  )
              ),
              SizedBox(width: Spacing.mediumPadding),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                // color: yellowColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(
                          fontFamily: 'Poppins',
                          fontSize: SizeText.mediumText,
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                      ),
                    ),
                    Text('NIM',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(
                          fontFamily: 'Poppins',
                          fontSize: SizeText.mediumText,
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                      ),
                    ),
                    Text('Prodi',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(
                          fontFamily: 'Poppins',
                          fontSize: SizeText.mediumText,
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: Spacing.mediumPadding),
        ElevatedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile())) ,
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.8),
              primary: babyColor,
              onPrimary: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.all(Spacing.mediumPadding),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              )
          ),
          child: Text('EDIT PROFIL',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),
          ),
        )
      ],
    );
  }

  Widget mainContent(){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.02,
          // color: Colors.red,
        ),
        GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: Spacing.mediumPadding,
                  vertical: Spacing.mediumPadding
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                  color: Color(0xB3FFFFFF)
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Pusat Bantuan',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.averageText,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
              ),
            )
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.mediumPadding,
                vertical: Spacing.mediumPadding
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                color: Color(0xB3FFFFFF)
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Ulasan',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.averageText,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
            ),
          )
        ),
      ],
    );
  }

borderDivider(){
  return const Divider(
    thickness: 2,
  );
}
}
