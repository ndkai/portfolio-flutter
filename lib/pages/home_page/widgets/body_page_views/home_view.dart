import 'package:flutter/material.dart';

import '../../../../components/constant.dart';
import '../../../../components/spacing.dart';
import '../../../../components/typography.dart';
import '../../../../generated/assets.dart';
import '../../../../ui/animation_avatar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 5),
        builder: (context, animationValue, _) {
          return Opacity(
              opacity: animationValue,
              child: const SizedBox(
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'FullStack Mobile ',
                                style: giantTitleTextStyle,
                              ),
                              Text(
                                'Flutter️ Developer ️',
                                style: giantTitleTextStyle,
                              ),
                              titleSpacing,
                              Text(
                                'Hi, i\'m Andy. A Passionate Mobile developer based in HCM, VietNam',
                                style: contentTextStyle,
                              ),
                              titleSpacing,
                              SocialView(),
                            ],
                          ),
                        ),
                        AnimatedAvatar()
                      ],
                    ),
                    partionSpacing,
                    SkillsView()
                  ],
                ),
              ));
        });
  }
}

class SocialView extends StatelessWidget {
  const SocialView({super.key});

  final double height = 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.iconsLinkedin,
          height: height,
        ),
        socialIconSpacing,
        Image.asset(
          Assets.iconsGithubSign,
          height: height,
        )
      ],
    );
  }
}

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Teck Skills |    ",
          style: smallTitleTextStyle,
        ),
        ...skills
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset(
                    "assets/icons/skills/$e.png",
                    height: 25,
                  ),
                ))
            .toList()
      ],
    );
  }
}
