import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page/widgets/home_page_body.dart';
import 'widgets/horizontal_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: DecoratedBox(
        decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage(Assets.imagesTechBg), fit: BoxFit.fill)
            ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [HorizontalAppbar(), HomePageBody()],
          ),
        ),
      )),
    );
  }
}
