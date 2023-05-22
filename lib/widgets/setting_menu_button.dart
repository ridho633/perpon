import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/spacing.dart';


class SettingMenuButton extends StatelessWidget {
  const SettingMenuButton(
      {Key? key,
        required this.title,
        this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.largePadding),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.transparent,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              // SvgPicture.asset(
              //   iconUrl + 'setting-icon-2/$icon.svg',
              //   width: 28,
              // ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Spacing.mediumPadding,
                      vertical: Spacing.smallPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight:
                          FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Poppins'

                          )),
                      const SizedBox(height: 4),
                      // Text(subtitle,
                      //     // textAlign: TextAlign.center,
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .headline5!
                      //         .copyWith(
                      //             fontWeight: FontWeight.w400,
                      //             color: blackColor)),
                    ],
                  ),
                ),
              ),
              // SvgPicture.asset(
              //   iconUrl + 'setting-icon-2/$icon.svg',
              //   width: 28,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
