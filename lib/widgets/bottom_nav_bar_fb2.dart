import 'package:flutter/material.dart';
import 'package:perpon/screens/auth/profile_page.dart';
import 'package:perpon/screens/dashboard.dart';
import 'package:perpon/screens/riwayat_buku.dart';
import '../screens/katalog.dart';

class BottomNavBarFb2 extends StatelessWidget {
  const BottomNavBarFb2({Key? key, required this.selected}) : super(key: key);

  final String selected;

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: selected,
                  index: '1',
                  onPressed:() {Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                    },
              ),
              const Spacer(),
              IconBottomBar(
                  text: "Katalog",
                  icon: Icons.search_outlined,
                  selected: selected,
                  index: '2',
                  onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Katalog()));
                    },
                  ),
              const Spacer(),
              IconBottomBar(
                  text: "Riwayat Buku",
                  icon: Icons.menu_book,
                  selected: selected,
                  index: '3',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => Riwayat_buku()));
                  }),
              const Spacer(),
              IconBottomBar(
                  text: "Profil",
                  icon: Icons.account_circle_sharp,
                  selected: selected,
                  index: '4',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ProfilePage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
        required this.text,
        required this.icon,
        required this.selected,
        required this.index,
        required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final String selected;
  final String index;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: (selected == index) ? Colors.blue : Colors.black54,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: (selected == index)
                  ? Colors.blue
                  : Colors.grey.withOpacity(.75)),
        )
      ],
    );
  }
}
