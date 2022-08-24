import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context, String title, {bool isTitle = false}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontFamily: isTitle
            ? "Meedori Sans"
            : DefaultTextStyle.of(context).style.fontFamily,
        wordSpacing: 10,
        fontSize: 34,
        color: Colors.black,
        fontWeight: FontWeight.w100,
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
