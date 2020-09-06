import 'package:document_search_dashboard/component/centered_view.dart';
import 'package:document_search_dashboard/component/topbar/topbar.dart';
import 'package:document_search_dashboard/component/upload_button.dart';
import 'package:document_search_dashboard/screen/search_result_page.dart';
import 'package:document_search_dashboard/screen/top_tags_page.dart';
import 'package:document_search_dashboard/util/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController;
  String search;

  @override
  void initState() {
    super.initState();
    search = "";
    searchController = TextEditingController()..addListener(() {
      setState(() {
        search = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double pageWidth = ScreenUtil.getPageWidth(sizingInformation);
        return Scaffold(
          body: CenteredView(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      TopBar(
                        pageWidth: pageWidth,
                        searchController: searchController,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      search.isNotEmpty
                          ? SearchResultPage(
                        pageWidth: pageWidth,
                        search: searchController.text,
                        onRelatedTagClicked: (chip) {
                          setState(() {
                            searchController.text = chip;
                          });
                        },
                      )
                          : TopTagsPage(
                        pageWidth: pageWidth,
                        onItemClicked: (chip) {
                          setState(() {
                            searchController.text = chip;
                          });
                        },
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
                search.isNotEmpty ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: UploadButton(onClick: () {

                    },),
                  ),
                ) : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
