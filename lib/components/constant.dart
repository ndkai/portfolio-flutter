import 'package:portfolio/models/project.dart';

import '../generated/assets.dart';

const skills = <String>[
  "flutter",
  "android",
  "dotnet",
  "reactjs",
  // "java",
  // "kotlin",
  // "dart",
  // "c#",
  // "typescript",
];

final projects = <Project>[
  Project(
      index: 0,
      name: 'TK SMART VISION EDU',
      description:
          'The project manages school activities such as attendance, timetables, meal plans, and inspections during the Covid-19 period.',
      img: Assets.projectsTkvs,
      techs: "Flutter    Firebase    Rest-API",
      demos: [
        Demo(
            type: DemoType.appstore,
            url: 'https://apps.apple.com/vn/app/tk-smart-vision/id1557479211'),
        Demo(
            type: DemoType.chplay,
            url:
                'https://play.google.com/store/apps/details?id=com.titkul.faikul&hl=vi&gl=US')
      ]),
  Project(
      index: 1,
      name: 'STEM KIDKUL EDU',
      description:
      'An Android application integrated with Blockly and Bluetooth to connect and control Arduino devices used in STEM education.',
      img: Assets.projectsTkbot,
      techs: "Android    Bluetooth    Blockly",
      demos: [
        Demo(
            type: DemoType.chplay,
            url:
            'https://play.google.com/store/apps/details?id=com.titkul.iot_app'),
      ]),
  Project(
      index: 2,
      name: 'VKHEALTH',
      description:
      'The project provides solutions for prevention, care, protection, and improvement of the health of the people nationwide',
      img: Assets.projectsVkhealth,
      techs: "Android    Java     Rest-API ",
      demos: [
        Demo(
            type: DemoType.chplay,
            url:
            'https://play.google.com/store/apps/details?id=vkhealth.app&hl=vi'),
      ]),
  Project(
      index: 3,
      name: "USAID - HOMIE  APP",
      description:
      'The project provides solutions for prevention, care, protection, and improvement of the health of the people nationwide',
      img: Assets.projectsTkvs,
      techs: "ReactJS    Ionic     Rest-API ",
      demos: [
        Demo(
            type: DemoType.chplay,
            url:
            'https://play.google.com/store/apps/details?id=vkhealth.app&hl=vi'),
        Demo(
            type: DemoType.appstore,
            url:
            'https://play.google.com/store/apps/details?id=vkhealth.app&hl=vi'),
      ]),
];

Map<String, String> socialLink = <String, String>{
  "github": "https://github.com/ndkai",
  "linkedin": "https://www.linkedin.com/in/kaind",
};
