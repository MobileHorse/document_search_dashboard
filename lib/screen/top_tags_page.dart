import 'package:document_search_dashboard/component/chip_group.dart';
import 'package:document_search_dashboard/component/dummy_data.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:flutter/material.dart';

class TopTagsPage extends StatefulWidget {

  final double pageWidth;
  final Function(String) onItemClicked;

  TopTagsPage({this.pageWidth, this.onItemClicked});

  @override
  _TopTagsPageState createState() => _TopTagsPageState();
}

class _TopTagsPageState extends State<TopTagsPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.pageWidth > 900 ? 900 : widget.pageWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.lightbulb_outline, size: 32,),
                  SizedBox(width: AppConfig.space,),
                  Text("Top tags:", style: TextStyle(fontSize: 24),),
                ],
              ),
              SizedBox(height: AppConfig.space,),
              ChipGroup(items: DummyData.dummyChips, onItemClicked: (chip) => widget.onItemClicked(chip),),
            ],
          ),
        )
      ],
    );
  }
}
