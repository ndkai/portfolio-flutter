import 'package:flutter/material.dart';
import 'colors.dart';


// Simple
const String fontFamily = "Google Sans";

const TextStyle appBarTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, fontFamily: fontFamily, fontWeight: FontWeight.bold);

const TextStyle giantTitleTextStyle = TextStyle(
    fontSize: 30, color: textPrimary, fontFamily: fontFamily, fontWeight: FontWeight.bold);

const TextStyle smallTitleTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, fontFamily: fontFamily, fontWeight: FontWeight.bold);

const TextStyle mediumTitleTextStyle = TextStyle(
    fontSize: 20, color: textPrimary, fontFamily: fontFamily, fontWeight: FontWeight.bold);

const TextStyle contentTextStyle = TextStyle(
    fontSize: 16, color: contentText, fontFamily: fontFamily, fontWeight: FontWeight.bold,);

const TextStyle headlineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, height: 1.5, fontFamily: "Roboto");

TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: primary);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18, color: Colors.white, height: 1, fontFamily: fontFamily);