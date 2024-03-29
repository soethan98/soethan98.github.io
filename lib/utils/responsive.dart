import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  const Responsive(
      {Key? key,
      required this.mobile,
      this.tablet,
      required this.desktop,
      this.mobileLarge})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1024) {
        return desktop;
      } else if (constraints.maxWidth >= 700 && tablet != null) {
        return tablet!;
      } else if (constraints.maxWidth >= 500 && mobileLarge != null) {
        return mobileLarge!;
      } else {
        return mobile;
      }
    });
  }
}
