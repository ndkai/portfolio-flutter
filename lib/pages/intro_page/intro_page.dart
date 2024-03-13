import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:portfolio/components/components.dart';
import 'package:portfolio/generated/assets.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> with TickerProviderStateMixin {
  final _code = "\$ flutter  pub  add  ";
  final _name = "andy_profile";
  final _fixedName = "mobile_dev";
  String animatedText = "";
  late AudioPlayer _audioPlayer;

  late AnimationController _inputTextController;
  late Animation<int> _inputTextAnimation;

  late AnimationController _dependenciesController;
  late Animation<int> _dependenciesAnimation;
  bool isResolvingDependencies = false;
  List<String> data = <String>[
    "Info (available)",
    "Project (available)",
    "Life (available)",
    "Passion (available)",
    "Quit (Never)",
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setFilePath(Assets.audiosKeyboardTap);
    setUpCmdAnimation();
    setUpDependenciesAnimation();
    _inputTextController.forward();
  }

  void setUpDependenciesAnimation() {
    _dependenciesController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _dependenciesAnimation =
        IntAnimation(begin: 0, end: 5).animate(_dependenciesController);
    _dependenciesController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _audioPlayer.play();
      }
      if (status == AnimationStatus.completed) {
        _audioPlayer.stop();
        setState(() {
          isResolvingDependencies = true;
        });
        _dependenciesController.forward();
        Navigator.of(context).pushNamed("/home");
      }
    });
  }

  void setUpCmdAnimation() {
    _inputTextController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _inputTextAnimation = IntAnimation(
            begin: 1, end: _code.length + _name.length + _fixedName.length * 2)
        .animate(_inputTextController);
    _inputTextController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _audioPlayer.play();
      }
      if (status == AnimationStatus.completed) {
        _audioPlayer.stop();
        setState(() {
          isResolvingDependencies = true;
        });
        _dependenciesController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _inputTextController,
            builder: (BuildContext context, Widget? child) {
              processAnimatedText();
              return Text(
                animatedText,
                style: giantTitleTextStyle,
              );
            },
          ),
          isResolvingDependencies
              ? Text(
                  " Resolving dependencies...",
                  style:
                      giantTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
                )
              : Container(),
          AnimatedBuilder(
              animation: _dependenciesController,
              builder: (context, child) {
                return Column(
                  children: data
                      .sublist(0, _dependenciesAnimation.value.toInt())
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            e,
                            style: mediumTitleTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: dependenciesColor),
                          ),
                        ),
                      )
                      .toList(),
                );
              })
        ],
      ),
    ));
  }

  void processAnimatedText() {
    int value = _inputTextAnimation.value;
    String code =
        _code.substring(0, value <= _code.length ? value : _code.length);
    String fixedName = "";
    int fixedNamePos = _code.length + _fixedName.length;
    int deleteFixedNamePos = _code.length + _fixedName.length * 2;

    if (value > _code.length && value <= fixedNamePos) {
      fixedName = _fixedName.substring(0, (value - _code.length));
    }

    if (value > fixedNamePos && value < deleteFixedNamePos) {
      fixedName =
          _fixedName.substring(0, (_fixedName.length - (value - fixedNamePos)));
    }

    String name = "";
    if (value > _code.length + _fixedName.length * 2) {
      name = _name.substring(
          0, value - (_code.length + _fixedName.length * 2) - 1);
    }

    animatedText = code + fixedName + name;
  }
}

class IntAnimation extends Animatable<int> {
  final int begin;
  final int end;

  IntAnimation({required this.begin, required this.end});

  @override
  int transform(double t) {
    int value = (end * t + begin).toInt();
    return value;
  }
}
