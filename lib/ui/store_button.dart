import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components/typography.dart';
import '../generated/assets.dart';



class StoreButton extends StatelessWidget {
  final String img;
  final String url;
  final String title;
  const StoreButton({super.key, required this.img, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        launchUrlString(url);
      },
      child: Row(
        children: [
          Image.asset(img, width: 30,),
          Text(
            "  $title",
            style: smallTitleTextStyle,
          ),
        ],
      ),
    );
  }
}

class AppStoreButton extends StoreButton{
  const AppStoreButton({super.key, super.img = Assets.iconsAppstore, required super.url, super.title = "App Store"});
}

class CHPlayButton extends StoreButton{
  const CHPlayButton({super.key, super.img = Assets.iconsChplay, required super.url, super.title = "CHPlay"});
}
