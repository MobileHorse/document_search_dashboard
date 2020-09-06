import 'package:document_search_dashboard/component/chip_group.dart';
import 'package:document_search_dashboard/component/dummy_data.dart';
import 'package:document_search_dashboard/component/match_item.dart';
import 'package:document_search_dashboard/component/upload_button.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:document_search_dashboard/model/match_model.dart';
import 'package:document_search_dashboard/screen/document_detail_page.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  final double pageWidth;
  final String search;
  final Function(String) onRelatedTagClicked;

  SearchResultPage({this.pageWidth, this.search, this.onRelatedTagClicked});

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> with TickerProviderStateMixin {

  List<MatchModel> matches = [];
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    matches = DummyData.dummyMatches;
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${matches.length} results found with keywords \"${widget.search}\"",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: AppConfig.space,
                ),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: getItemSpace(),
                  mainAxisSpacing: AppConfig.space,
                  childAspectRatio: 100 / 130,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(0),
                  children: matches.asMap().entries.map<Widget>((e) => buildMatchItem(e.key, e.value)).toList(),
                ),
              ],
            )),
        SizedBox(
          width: AppConfig.space * 2,
        ),
        Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Related tags:",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: AppConfig.space,
              ),
              ChipGroup(
                items: DummyData.dummyChips,
                onItemClicked: (chip) => widget.onRelatedTagClicked(chip),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double getItemSpace() {
    return AppConfig.space *
        (widget.pageWidth < 840
            ? 1
            : widget.pageWidth < 1240 ? 2 : 4);
  }

  Widget buildMatchItem(int index, MatchModel match) {
    int count = matches.length;
    final Animation<double> animation =
    Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => FadeTransition(
        opacity: animation,
        child: Transform(
          transform: Matrix4.translationValues(
              0.0, 200 * (1.0 - animation.value), 0.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DocumentDetailPage(match),));
            },
            child: MatchItem(match: match, width: (widget.pageWidth - AppConfig.space * 2 - 400 - getItemSpace() * 2) / 3,),
          ),
        ),
      ),
    );
  }
}
