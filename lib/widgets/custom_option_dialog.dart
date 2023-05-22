import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/color.dart';
import '../components/spacing.dart';

class CustomOptionDialog extends StatelessWidget {
  const CustomOptionDialog({
    Key? key,
    required this.title,
    required this.isYesButtonPressed,
    required this.isNoButtonPressed,
    required this.actionButton,
  }) : super(key: key);

  final String title;
  final VoidCallback isYesButtonPressed;
  final VoidCallback isNoButtonPressed;
  final List<String> actionButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 15)),
      actionsPadding: EdgeInsets.only(bottom: Spacing.smallPadding),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: isNoButtonPressed,
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    primary: Colors.transparent,
                    onPrimary: primaryColor,
                    fixedSize:
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Spacing.smallPadding,
                        vertical: Spacing.mediumPadding)),
                child: Text(actionButton[0],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(
                        fontWeight:
                        FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Poppins'
                    )),
              ),
              ElevatedButton(
                onPressed: isYesButtonPressed,
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    primary: Colors.red,
                    fixedSize:
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Spacing.smallPadding,
                        vertical: Spacing.mediumPadding)),
                child: Text(actionButton[1],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(
                    fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: whiteColor)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
