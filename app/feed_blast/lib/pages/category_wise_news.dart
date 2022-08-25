import 'dart:convert';

import 'package:feed_blast/models/news_mode.dart';
import 'package:feed_blast/widgets/appbar.dart';
import 'package:feed_blast/widgets/news_list_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CategoryWiseNews extends StatefulWidget {
  String query = '';
  CategoryWiseNews({Key? key, required this.query}) : super(key: key);

  @override
  State<CategoryWiseNews> createState() => _CategoryWiseNewsState();
}

class _CategoryWiseNewsState extends State<CategoryWiseNews> {
  List<NewsModel> newsModelList = <NewsModel>[];

  fetchNewsFromAPI(String category) async {
    String apiUrl = "https://feed-blast.herokuapp.com/prototype";
    Response response = await get(Uri.parse(apiUrl));

    //? https://stackoverflow.com/a/69392743/10934636 bugfix for special characters
    Map news = jsonDecode(utf8.decode(response.bodyBytes));
    Map categoryElement;

    setState(() {
      for (categoryElement in news[category]) {
        NewsModel model = NewsModel();

        model = model.parseMap(categoryElement);

        newsModelList.add(model);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNewsFromAPI(widget.query.toString().toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, widget.query),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            NewsListView(newsModelList: newsModelList),
          ],
        ),
      ),
    );
  }
}
