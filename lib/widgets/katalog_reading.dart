import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/components/spacing.dart';
import 'package:perpon/widgets/two_side_rounded_button.dart';

import '../components/consttants.dart';
import 'book_rating.dart';

class Katalog_Reading extends StatelessWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final VoidCallback pressDetails;
  final VoidCallback pressRead;

  const Katalog_Reading({
    Key? key,
    required this.image,
    required this.title,
    required this.auth,
    required this.rating,
    required this.pressDetails,
    required this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        // color: Colors.green,
        child: Column(
          children: [
            Row(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.2,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(29),
                //     boxShadow: [
                //       BoxShadow(
                //         offset: Offset(0, 10),
                //         blurRadius: 33,
                //         color: kShadowColor,
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  // color: Colors.blue,
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      Positioned(
                        right: 0,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                ),
                                onPressed: () {},
                              ),
                              BookRating(score: rating),
                            ],
                          ),
                      )
                    ],
                  )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: auth,
                      style: TextStyle(
                        color: kLightBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: pressDetails,
                  child: Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text("Details"),
                  ),
                ),
                Expanded(
                  child: TwoSideRoundedButton(
                    text: "Read",
                    press: pressRead,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
