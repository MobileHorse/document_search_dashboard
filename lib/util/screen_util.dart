import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:document_search_dashboard/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenUtil {
  static double getPageWidth(SizingInformation sizeInfo) {
    if (sizeInfo.isDesktop) return sizeInfo.screenSize.width - AppConfig.pagePaddingDesktop * 2;
    if (sizeInfo.isTablet) return sizeInfo.screenSize.width - AppConfig.pagePaddingTablet * 2;
    if (sizeInfo.isMobile) return sizeInfo.screenSize.width - AppConfig.pagePaddingMobile * 2;
    return 0;
  }

  static bool isDarkMode(BuildContext context) {
    return AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  }
}