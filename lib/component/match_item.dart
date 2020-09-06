import 'package:document_search_dashboard/component/image/square_image.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:document_search_dashboard/model/match_model.dart';
import 'package:flutter/material.dart';

class MatchItem extends StatefulWidget {

  final MatchModel match;
  final double width;

  MatchItem({this.match, this.width});

  @override
  _MatchItemState createState() => _MatchItemState();
}

class _MatchItemState extends State<MatchItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SquareImage(image: widget.match.document.thumbnail, borderRadius: AppConfig.borderRadius,),
        SizedBox(height: widget.width * 0.025,),
        Text(widget.match.document.title, style: TextStyle(fontSize: widget.width * 0.1), maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis,),
        SizedBox(height: widget.width * 0.025,),
        Text("${widget.match.match} matches", style: TextStyle(fontSize: widget.width * 0.08, color: Colors.grey),),
      ],
    );
  }
}
