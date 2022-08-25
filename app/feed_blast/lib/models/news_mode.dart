class NewsModel {
  late String headline;
  late String summary;
  late String imageUrl;
  late String newsUrl;

  NewsModel({
    this.headline = "headline",
    this.summary = "summary",
    this.imageUrl = "image url",
    this.newsUrl = "news url",
  });

  factory NewsModel.fromMap(Map news) {
    return NewsModel(
      headline: news['headline'],
      newsUrl: news['link'],
      summary: news['summary'],
      imageUrl: news['image_url'],
    );
  }

  NewsModel parseMap(Map news) {
    return NewsModel(
      headline: news['headline'],
      newsUrl: news['link'],
      summary: news['summary'],
      imageUrl: news['image_url'],
    );
  }
}
