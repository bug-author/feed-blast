import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  startApp() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Feed Blast",
              style: TextStyle(
                fontFamily: "Meedori Sans",
                fontSize: 48,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "@shy-tan",
              style: TextStyle(
                fontFamily: "Meedori Sans",
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 110,
            ),
            SpinKitFadingFour(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
