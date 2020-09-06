import 'package:document_search_dashboard/component/centered_view.dart';
import 'package:document_search_dashboard/component/image/square_image.dart';
import 'package:document_search_dashboard/component/material_icon_button.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:document_search_dashboard/model/match_model.dart';
import 'package:document_search_dashboard/util/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DocumentDetailPage extends StatefulWidget {
  final MatchModel match;

  DocumentDetailPage(this.match);

  @override
  _DocumentDetailPageState createState() => _DocumentDetailPageState();
}

class _DocumentDetailPageState extends State<DocumentDetailPage> {
  String tags = "";

  @override
  void initState() {
    super.initState();
    widget.match.document.tags.forEach((element) {
      tags += "#$element ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double pageWidth = ScreenUtil.getPageWidth(sizingInformation);
        double columnWidth = (pageWidth - AppConfig.space * 6) / 2;
        return Scaffold(
          body: CenteredView(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConfig.space),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: columnWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.match.document.title,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 32),
                                ),
                                SizedBox(
                                  height: AppConfig.space,
                                ),
                                Text(
                                  "${widget.match.match} matches",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppConfig.space * 4,
                          ),
                          Container(
                            width: columnWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Tags: $tags",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    )),
                                    SizedBox(
                                      width: AppConfig.space * 2,
                                    ),
                                    MaterialIconButton(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        size: 36,
                                        color: Colors.grey,
                                      ),
                                      padding: 8,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: columnWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Original",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 32),
                                ),
                                SizedBox(
                                  height: AppConfig.space,
                                ),
                                SquareImage(
                                  image: widget.match.document.thumbnail,
                                  elevation: 5,
                                  borderRadius: 0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppConfig.space * 4,
                          ),
                          Container(
                            width: columnWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transcription",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 32),
                                ),
                                SizedBox(
                                  height: AppConfig.space,
                                ),
                                Card(
                                  color: Colors.transparent,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    side: BorderSide(
                                      color: Colors.grey.withOpacity(0.0),
                                      width: 0,
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 100 / 100,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppConfig.space,
                                          vertical: AppConfig.space * 2),
                                      child: SingleChildScrollView(
                                        child: Text(
                                          widget.match.document.transcription,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 32),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
