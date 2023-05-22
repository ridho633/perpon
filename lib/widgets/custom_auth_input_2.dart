import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:perpon/components/color.dart';
import 'package:perpon/components/size_text.dart';
import 'package:perpon/components/spacing.dart';

class CustomAuthInput2 extends StatefulWidget {
  const CustomAuthInput2(
      {Key? key,
        this.hintText,
        this.labelText,
        this.controller,
        this.validator,
        this.enabled,
        this.multiline = false,
        this.dense = false,
        this.maxLength,
        this.keyboard = TextInputType.text,
        this.action = TextInputAction.done,
        this.isPassword = false,
        this.autoValidate = AutovalidateMode.disabled,
        // this.minLength
      })
      : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool isPassword;
  final bool multiline;
  final bool dense;
  final int? maxLength;
  // final int? minLength;
  final AutovalidateMode autoValidate;
  final TextInputType keyboard;
  final TextInputAction action;
  final String? labelText;

  @override
  State<CustomAuthInput2> createState() => _CustomAuthInput2State();
}

class _CustomAuthInput2State extends State<CustomAuthInput2> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          textInputAction: widget.action,
          cursorColor: Colors.black,
          autovalidateMode: widget.autoValidate,
          keyboardType: widget.keyboard,
          controller: widget.controller,
          validator: widget.validator,
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w500),
          obscureText: _passwordVisible,
          maxLines: widget.multiline ? 3 : 1,
          minLines: 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            isDense: widget.dense,
            filled: true,
            counter: Offstage(),
            labelText: widget.labelText,
            hintText: widget.hintText,
            labelStyle: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Outfit', color: MyColors.inputBorderColor),
            hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Outfit', color: MyColors.inputBorderColor, fontSize: 15),
            errorStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: MyColors.inputErrorColor, fontSize: SizeText.smallText),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.inputBorderColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.inputBorderColor)),
            contentPadding: EdgeInsets.symmetric(
                horizontal: Spacing.mediumPadding,
                vertical: widget.multiline ? Spacing.mediumPadding : 0),
            suffixIcon: (widget.isPassword)
                ? Padding(
              padding: EdgeInsets.only(right: Spacing.smallPadding),
              child: IconButton(
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}
