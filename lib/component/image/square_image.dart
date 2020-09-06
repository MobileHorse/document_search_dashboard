import 'package:cached_network_image/cached_network_image.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {

  final String image;
  final double elevation, borderRadius;
  final String placeholder;

  SquareImage({this.image, this.elevation = 0, this.borderRadius = 8, this.placeholder = "images/avatar_placeholder.png"});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 100 / 100,
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage(placeholder),
          image: CachedNetworkImageProvider(image),
        ),
      ),
    );
  }
}
