import 'package:flutter/material.dart';
import 'body_page_views/about_view.dart';
import 'body_page_views/home_view.dart';
import 'body_page_views/project_view.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: PageView.builder(itemBuilder: (context, index){
      return  Center(
        child: _buildPageView(index)
      );
    }, itemCount: 4,));
  }

  Widget _buildPageView(int index){
    switch(index) {
      case 0:
        return const HomeView();
      case 1:
        return const AboutView();
      case 2:
        return const ProjectView();
      case 3:
      default:
        return const SizedBox.shrink();
    }

  }
}


