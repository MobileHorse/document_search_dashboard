import 'package:document_search_dashboard/config/app_config.dart';
import 'package:flutter/material.dart';

class ChipGroup extends StatelessWidget {
  final List<String> items;
  final Function(String) onItemClicked;

  ChipGroup({@required this.items, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: buildItems(),
    );
  }

  List<Widget> buildItems() {
    List<Widget> elements = [];
    for (int i = 0; i < items.length; i++) {
      elements.add(buildChipItem(items[i]));
      if (i < items.length - 1) {
        elements.add(SizedBox(width: 20,));
      }
    }
    return elements;
  }

  Widget buildChipItem(String label) {
    return Padding(padding: const EdgeInsets.only(bottom: 20), child: InkWell(
      onTap: () => onItemClicked(label),
      child: Chip(label: Text(label, style: TextStyle(fontSize: 20, color: Colors.white),), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), backgroundColor: AppConfig.chipColor),
    ),);
  }
}
