import 'package:flutter/material.dart';
import 'package:portfolio/generated/assets.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/ui/store_button.dart';
import '../../../../components/colors.dart';
import '../../../../components/constant.dart';
import '../../../../components/spacing.dart';
import '../../../../components/typography.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            partionSpacing,
            Text(
              "PORTFOLIO",
              style: smallTitleTextStyle.copyWith(color: primary),
            ),
            contentSpacing,
            const Text(
              "Projects I have participated in",
              style: mediumTitleTextStyle,
            ),
            projectSpacing,
            ...projects.map((project) => _projectView(project))
          ],
        ),
      ),
    );
  }

  Widget _projectView(Project project){
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          project.index % 2 == 0 ? Image.asset(
            project.img,
            width: 400,
          ) : const SizedBox(),
          SizedBox(
            width: 300,
            child: _projectContent(project),
          ),
          project.index % 2 == 1 ? Image.asset(
            project.img,
            width: 400,
          ) : const SizedBox(),
        ],
      ),
    );
  }

  Widget _projectContent(Project project){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          project.name,
          style:
          smallTitleTextStyle.copyWith(color: primary),
        ),
        projectSpacing,
        Text(
          project.description,
          style: contentTextStyle,
        ),
        projectSpacing,
        Text(
          project.techs,
          style: smallTitleTextStyle,
        ),
        projectSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: project.demos.map((e){
            if(e.type == DemoType.appstore){
              return AppStoreButton(
                url:
                e.url,
              );
            }
            if(e.type == DemoType.chplay){
              return CHPlayButton(
                url:
                e.url,
              );
            }
            return const SizedBox();
          }).toList(),
        )
      ],
    );
  }
}
