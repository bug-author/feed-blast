import 'package:flutter/material.dart';

import '../models/news_mode.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    Key? key,
    required this.newsModelList,
  }) : super(key: key);

  final List<NewsModel> newsModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: newsModelList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: InkWell(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: newsModelList[index].imageUrl != ""
                        ? Image.network(
                            newsModelList[index].imageUrl,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          )
                        : Image.asset(
                            'assets/images/no_img.png',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      newsModelList[index].headline,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Summary: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: newsModelList[index].summary,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
