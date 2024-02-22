import 'package:flutter/material.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;
  const PrimaryButton({ super.key, required this.text, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(12.0)),
          foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: primaryColor)
            )
          )
        ),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: whiteColor)),
      ),
    );
  }
}