import 'package:flutter/cupertino.dart';
import 'package:newsApp/Models/news_models.dart';
import 'package:newsApp/Service/news_service.dart';
import 'package:newsApp/Utils/Enums/loading_status_enum.dart';
import 'package:newsApp/Utils/constants.dart';

class NewsViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  News articles;

  String ddbcountry = Constants.countries.keys.toList().first;
  String ddbtag = Constants.tags.keys.toList().first;
  void setddbCountry({String country}) {
    ddbcountry = country;
    notifyListeners();
    getNewsByCountryAndTag(
        country: Constants.countries[ddbcountry].toLowerCase(),
        tag: ddbtag.toLowerCase());
  }

  void setddbTag({String tag}) {
    ddbtag = tag;
    notifyListeners();
    getNewsByCountryAndTag(
        country: Constants.countries[ddbcountry].toLowerCase(),
        tag: ddbtag.toLowerCase());
  }

  void getNewsByCountryAndTag({String country, String tag}) async {
    this.loadingStatus = LoadingStatus.searching;
    News newsArticles = await NewsService().getNews(country: country, tag: tag);
    this.articles = newsArticles;
    if (this.articles == null) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
