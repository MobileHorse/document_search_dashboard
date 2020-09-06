import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:document_search_dashboard/component/circular_network_image.dart';
import 'package:document_search_dashboard/component/material_icon_button.dart';
import 'package:document_search_dashboard/component/search_bar.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:document_search_dashboard/util/screen_util.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final double pageWidth;
  final TextEditingController searchController;

  TopBar({this.pageWidth, this.searchController});

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.pageWidth > 800) return buildLargeView();
    return buildSmallView();
  }

  Widget buildLargeView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(ScreenUtil.isDarkMode(context)
              ? 'images/logo_dark.png'
              : 'images/logo_light.png'),
          height: 70,
        ),
        SizedBox(
          width: widget.pageWidth > 1200 ? 160 : 60,
        ),
        Expanded(
            child: SearchBar(
          controller: widget.searchController,
        )),
        SizedBox(
          width: widget.pageWidth > 1200 ? 160 : 60,
        ),
        MaterialIconButton(
            onTap: () {
              AdaptiveTheme.of(context).toggleThemeMode();
            },
            icon: Icon(
              Icons.brightness_6,
              size: 32,
            )),
        SizedBox(
          width: 20,
        ),
        MaterialIconButton(
            onTap: () {},
            icon: Icon(
              Icons.help_outline,
              size: 36,
            )),
        SizedBox(
          width: 30,
        ),
        CircularNetworkImage(
          width: 64,
          image:
              "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
          placeholder: "images/avatar_placeholder.png",
        ),
      ],
    );
  }

  Widget buildSmallView() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(ScreenUtil.isDarkMode(context)
                  ? 'images/logo_dark.png'
                  : 'images/logo_light.png'),
              height: 70,
            ),
            Expanded(child: Container()),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                borderRadius: BorderRadius.circular(32),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.brightness_6,
                    size: 32,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(32),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.help_outline,
                    size: 36,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            CircularNetworkImage(
              width: 64,
              image:
                  "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
              placeholder: "images/avatar_placeholder.png",
            ),
          ],
        ),
        SizedBox(
          height: AppConfig.space,
        ),
        Container(
          width: double.infinity,
          child: SearchBar(
            controller: widget.searchController,
          ),
        ),
      ],
    );
  }
}
