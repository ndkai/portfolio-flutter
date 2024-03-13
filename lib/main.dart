import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page/home_page.dart';
import 'package:portfolio/pages/intro_page/intro_page.dart';
import 'package:portfolio/ui/page_transition.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        return buildPage(context, settings.name!);
      },
      debugShowCheckedModeBanner: false,
    );
  }
  Widget responsiveWrapper(BuildContext context, Widget widget){
    return BouncingScrollWrapper.builder(
        context, widget,
        dragWithMouse: true);
  }
  PageRouteBuilder? buildPage(BuildContext context, String name) {
    switch (name) {
      case '/':
        return customPageRoute(responsiveWrapper(context, const HomePage()));
      case '/home':
        return customPageRoute(responsiveWrapper(context, const HomePage()));
      default:
        return null;
    }
  }
}

