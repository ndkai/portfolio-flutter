import 'package:flutter/material.dart';
import 'package:portfolio/components/components.dart';


class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 750,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/mobile_dev.gif"), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primary)),
          ),
          SizedBox(
            width: 400,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About me",
                  style: smallTitleTextStyle.copyWith(color: primary),
                ),
                contentSpacing,
                const Text(
                  "A dedicated Mobile Developer based in Ho Chi Minh, VietNam",
                  style: mediumTitleTextStyle,
                ),
                contentSpacing,
                const Text(
                  "👋 Hello! I'm Andy, a passionate mobile app developer with a keen interest in creating innovative and user-friendly applications. I thrive on turning ideas into reality through code, and I specialize in crafting seamless and engaging experiences for users.",
                  style: contentTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
