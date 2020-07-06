import 'package:newsApp/Models/news_models.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailViewModel {
  NewsDetailViewModel({Result news}) : _news = news;
  Result _news;
  String get description {
    return _news.description;
  }

  String get image {
    return _news.image;
  }

  String get name {
    return _news.name;
  }

  String get source {
    return _news.source;
  }

  String get url {
    return _news.url;
  }

  Future<void> launchInBrowser() async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
