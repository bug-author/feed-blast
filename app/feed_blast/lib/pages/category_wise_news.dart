import 'package:feed_blast/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CategoryWiseNews extends StatefulWidget {
  String query = '';
  CategoryWiseNews({Key? key, required this.query}) : super(key: key);

  @override
  State<CategoryWiseNews> createState() => _CategoryWiseNewsState();
}

class _CategoryWiseNewsState extends State<CategoryWiseNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, widget.query),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('Category wise news'),
        ),
      ),
    );
  }
}
