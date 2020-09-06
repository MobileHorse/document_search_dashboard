import 'package:document_search_dashboard/util/screen_util.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {

  final TextEditingController controller;

  SearchBar({@required this.controller});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final double height = 60;
  bool showClearButton;

  @override
  void initState() {
    super.initState();
    showClearButton = false;
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        setState(() {
          showClearButton = true;
        });
      } else {
        setState(() {
          showClearButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeOn = ScreenUtil.isDarkMode(context);
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(darkModeOn ? 0.1 : 1.0),
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(
            color: darkModeOn
                ? Colors.white.withOpacity(0.1)
                : Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
                controller: widget.controller,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(fontSize: 24),
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search for words in documents",
                    suffixIcon: hidingIcon()),
                onChanged: (text) {

                },
              )),
          Icon(
            Icons.search,
            size: 36,
          )
        ],
      ),
    );
  }

  Widget hidingIcon() {
    if (showClearButton) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              widget.controller.clear();
            });
          },
          borderRadius: BorderRadius.circular(32),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.clear, size: 28,),
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
