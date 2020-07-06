import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsApp/Utils/constants.dart';

class NewsImage extends StatelessWidget {
  final String imageUrl;

  const NewsImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) {
        return _image(imageProvider);
      },
      placeholder: (context, url) {
        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Constants.kOrange),
        ));
      },
      errorWidget: (context, url, error) {
        return FlutterLogo(
          colors: Constants.kOrange,
        );
      },
    );
  }

  Widget _image(ImageProvider ip) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: ip,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
