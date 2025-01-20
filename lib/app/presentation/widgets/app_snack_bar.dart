import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/utils/resources/screen_size.dart';

class AppSnackBar {
  static show(BuildContext context, {required String message, String? label}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(
          bottom: ScreenSize.height -
              ScreenSize.paddingTop -
              ScreenSize.paddingBottom -
              158.0,
          left: 8.0,
          right: 8.0,
        ),
        content: Text(message),
        action: label == null
            ? null
            : SnackBarAction(
                label: label,
                onPressed: () {},
              ),
      ),
    );
  }
}
