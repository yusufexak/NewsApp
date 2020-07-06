import 'package:flutter/material.dart';
import 'package:newsApp/Utils/Enums/loading_status_enum.dart';
import 'package:newsApp/Utils/constants.dart';
import 'package:newsApp/Viewmodels/news_viewmodel.dart';
import 'package:newsApp/Widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsViewModel>(
      context,
      listen: false,
    ).getNewsByCountryAndTag(tag: "general", country: "tr");
  }

  Widget _buildList(NewsViewModel nvm) {
    switch (nvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Constants.kOrange),
          ),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsGrid(
            articles: nvm.articles,
          ),
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var nvm = Provider.of<NewsViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Text(
                'News',
                style: Constants.kPageTitleStyle
                    .copyWith(color: Constants.kBlack, fontSize: 48),
              ),
            ),
            Divider(
              height: 40,
              color: Constants.kOrange,
              thickness: 8,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        items: Constants.countries.keys
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: Constants.kSubtitleStyle.copyWith(
                                      color: Constants.kGrey, fontSize: 18),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          Provider.of<NewsViewModel>(context, listen: false)
                              .setddbCountry(country: value);
                        },
                        value: nvm.ddbcountry,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: DropdownButton(
                        items: Constants.tags.keys
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: Constants.kSubtitleStyle.copyWith(
                                      color: Constants.kGrey, fontSize: 18),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          Provider.of<NewsViewModel>(context, listen: false)
                              .setddbTag(tag: value);
                        },
                        value: nvm.ddbtag,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Headline',
                style: Constants.kTitleStyle.copyWith(
                    fontSize: 30,
                    color: Constants.kBlack,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: _buildList(nvm),
            ),
          ],
        ),
      ),
    );
  }
}
