import 'package:flutter/material.dart';

enum RenderMode {
  auto,
  mobile,
  tablet,
  desktop,
}

const double deviceTabletWidth = 900;
const double deviceDesktopWidth = 1100;

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.renderMode = RenderMode.auto,
  }) : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final RenderMode renderMode;

  static bool isMobile(context) =>
      MediaQuery.of(context).size.width < deviceTabletWidth;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < deviceDesktopWidth &&
      MediaQuery.of(context).size.width >= deviceTabletWidth;

  static bool isDesktop(context) =>
      MediaQuery.of(context).size.width >= deviceDesktopWidth;

  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;

    switch (renderMode) {
      case RenderMode.auto:
        if (widthDevice > deviceDesktopWidth && desktop != null) {
          return desktop!;
        }
        if (widthDevice >= deviceTabletWidth && tablet != null) {
          return tablet!;
        }
        return mobile ?? Container();
      case RenderMode.mobile:
        return mobile ?? Container();
      case RenderMode.tablet:
        return tablet ?? Container();
      case RenderMode.desktop:
        return desktop ?? Container();
    }
  }
}
