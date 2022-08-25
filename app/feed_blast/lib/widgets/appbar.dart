import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context, String title) {
  return AppBar(
    toolbarHeight: 80,
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: "Meedori Sans",
        wordSpacing: 10,
        fontSize: 34,
        color: Colors.black,
        fontWeight: FontWeight.w600,
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
