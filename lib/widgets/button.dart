import 'package:flutter/material.dart';
import 'package:suitmedia_mobile/constants.dart';

enum ButtonType { Small, Fit }

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final bool? enable;

  const PrimaryButton(
    this.label, {
    Key? key,
    this.onPressed,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: secondaryTextColor,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
