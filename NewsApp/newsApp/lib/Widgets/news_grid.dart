import 'package:flutter/material.dart';
import 'package:newsApp/Models/news_models.dart';
import 'package:newsApp/Utils/constants.dart';
import 'package:newsApp/Viewmodels/news_detail_viewmodel.dart';
import 'package:newsApp/Views/news_detail.dart';
import 'package:newsApp/Widgets/news_image.dart';

class NewsGrid extends StatelessWidget {
  final News articles;

  const NewsGrid({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: this.articles.result.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 2
                  : 3),
      itemBuilder: (context, index) {
        final articlee = this.articles.result[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailView(
                      articlee: NewsDetailViewModel(
                    news: articlee,
                  )),
                ));
          },
          child: Hero(
            tag: articlee.image,
            child: GridTile(
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: 40, left: 10, right: 10, top: 10),
                child: NewsImage(
                  imageUrl: articlee.image,
                ),
              ),
              footer: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: Text(
                  articlee.name,
                  style: Constants.kSubtitleStyle
                      .copyWith(color: Constants.kBlack, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
