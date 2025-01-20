import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/utils/resources/screen_size.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final Color borderColor;
  final Color bgColor;
  final Color labelColor;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;
  final double largura;
  final double borderWidth;
  final double altura;
  final double elevation;

  const AppButton({
    required this.onTap,
    required this.label,
    this.borderColor = Colors.blue,
    this.largura = 100.0,
    this.altura = 60.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.bgColor = Colors.blue,
    this.labelColor = Colors.white,
    this.borderWidth = 1.0,
    this.elevation = 2.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      width: ScreenSize.wp(largura),
      margin: EdgeInsets.only(
        top: marginTop,
        left: marginLeft,
        right: marginRight,
        bottom: marginBottom,
      ),
      child: MaterialButton(
        elevation: elevation,
        textColor: labelColor,
        color: bgColor,
        splashColor: Colors.white,
        disabledTextColor: Colors.grey,
        disabledColor: Colors.white,
        disabledElevation: 0.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: borderWidth,
              color: onTap != null ? borderColor : Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
