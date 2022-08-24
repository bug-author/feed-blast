import 'dart:convert';

import 'package:feed_blast/pages/category_wise_news.dart';
import 'package:feed_blast/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> navBarItem = [
    "World",
    "Analysis",
    "Politics",
    "Health",
    "Technology"
  ];

  fetchNewsFromAPI() async {
    String apiUrl = "https://feed-blast.herokuapp.com/prototype";
    Response response = await get(Uri.parse(apiUrl));
    Map news = jsonDecode(response.body);
    print(news);
  }

  @override
  void initState() {
    super.initState();
    fetchNewsFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'FEED BLAST'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryWiseNews(
                            query: navBarItem[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          navBarItem[index],
                          style: const TextStyle(
                            fontSize: 19,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
