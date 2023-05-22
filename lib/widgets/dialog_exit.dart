import 'dart:io';
import 'package:flutter/material.dart';
import 'package:perpon/components/spacing.dart';

import '../components/size_text.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apakah anda yakin ingin keluar dari aplikasi ?',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeText.averageText,
                        fontFamily: 'Poppins')
                ),
                SizedBox(height: Spacing.bigPadding),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        child:
                        Text('Keluar',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeText.averageText,
                                    fontFamily: 'Poppins')),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800),
                      ),
                    ),
                    SizedBox(width:Spacing.mediumPadding),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Batal',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeText.averageText,
                                  color: Colors.black,
                                  fontFamily: 'Poppins')),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white)
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
