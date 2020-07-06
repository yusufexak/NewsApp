import 'package:dio/dio.dart';
import 'package:newsApp/Models/news_models.dart';

class NewsService {
  final client = Dio()
    ..options.baseUrl = "https://api.collectapi.com"
    ..options.contentType = "application/json";

  Future<News> getNews({String country = "en", String tag = "sport"}) async {
    final response = await client.get(
      "/news/getNews?country=$country&tag=$tag",
      options: Options(
        headers: {
          "authorization":
              "apikey 3rLxmYONeev8RgMzUYkaEa:270Nmoru8g9gJKMB5X6YEW"
        },
      ),
    );
    final data = response.data;
    return News.fromJson(data);
  }
}
