import 'package:flutter/material.dart';
import 'package:newsApp/Utils/constants.dart';
import 'package:newsApp/Viewmodels/news_detail_viewmodel.dart';

class NewsDetailView extends StatefulWidget {
  final NewsDetailViewModel articlee;

  const NewsDetailView({Key key, @required this.articlee}) : super(key: key);
  @override
  _NewsDetailViewState createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.articlee.source,
          style: Constants.kPageTitleStyle
              .copyWith(color: Constants.kBlack, fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: InkWell(
              onTap: () {
                widget.articlee.launchInBrowser();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      alignment: Alignment.center,
                      color: Constants.kOrange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.articlee.name,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: Constants.kSubtitleStyle.copyWith(
                              fontSize: 18,
                              color: Constants.kGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Hero(
                      tag: widget.articlee.image,
                      child: Image.network(
                        widget.articlee.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.articlee.description,
                    style: Constants.kSubtitleStyle.copyWith(
                        color: Constants.kGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
