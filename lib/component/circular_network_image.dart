import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularNetworkImage extends StatelessWidget {
  final double width;
  final String image;
  final String placeholder;

  CircularNetworkImage(
      {@required this.width,
      @required this.image,
      this.placeholder = "images/avatar_placeholder.png"});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => buildWidget(imageProvider),
        placeholder: (context, url) => buildWidget(AssetImage(placeholder)),
        errorWidget: (context, url, error) => buildWidget(
              AssetImage(placeholder),
            ));
  }

  Widget buildWidget(ImageProvider imageProvider) {
    return Container(
        width: width,
        height: width,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image:
                new DecorationImage(fit: BoxFit.cover, image: imageProvider)));
  }
}
