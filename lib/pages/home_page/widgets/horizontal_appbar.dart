import 'package:flutter/material.dart';
import '../../../components/spacing.dart';
import '../../../components/typography.dart';

class HorizontalAppbar extends StatelessWidget {
  const HorizontalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleText("Ndkai", onTap: (){}),
        Row(
          children: [
            titleText("Home", onTap: (){}),
            titleSpacing,
            titleText("About", onTap: (){}),
            titleSpacing,
            titleText("Projects", onTap: (){}),
            titleSpacing,
            titleText("Contact", onTap: (){}),
          ],
        )
      ],
    );
  }

  Widget titleText(String text, {required Function onTap}){
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Text(text, style: appBarTextStyle,),
    );
  }
}
