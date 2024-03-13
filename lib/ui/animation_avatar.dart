import 'dart:math';

import 'package:flutter/material.dart';

import '../generated/assets.dart';

class AnimatedAvatar extends StatefulWidget {
  const AnimatedAvatar({super.key});

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar>
    with TickerProviderStateMixin {
  late AnimationController _clipHorizonAnimationController;
  late Animation<double> _clipHorizonAnimation;
  late AnimationController _clipVerticalAnimationController;
  late Animation<double> _clipVerticalAnimation;

  @override
  void initState() {
    super.initState();
    _clipHorizonAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _clipHorizonAnimation = Tween<double>(begin: 0, end: 1)
        .animate(_clipHorizonAnimationController);

    _clipVerticalAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _clipVerticalAnimation = Tween<double>(begin: 1, end: 0)
        .animate(_clipVerticalAnimationController);


  }

  @override
  void dispose() {
    _clipHorizonAnimationController.dispose();
    _clipVerticalAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _clipHorizonAnimationController.repeat(reverse: true);
    _clipVerticalAnimationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          Listenable.merge([_clipHorizonAnimation, _clipVerticalAnimation]),
      builder: (context, child) {
        return ClipPath(
            clipper: EllipseClipPath(
                horizontalPadding: (_clipHorizonAnimation.value * 30) ,
                verticalPadding: (_clipVerticalAnimation.value * 30)),
            child: child);
      },
      child: Container(
        height: 250,
        width: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesMe)),
        ),
      ),
    );
  }

}

class EllipseClipPath extends CustomClipper<Path> {
  final double horizontalPadding;
  final double verticalPadding;

  EllipseClipPath(
      {required this.horizontalPadding, required this.verticalPadding});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addArc(
        Rect.fromLTWH(0, 0, size.width - horizontalPadding,
            size.height - verticalPadding),
        0,
        pi * 2);

 //   path.addArc(Rect.fromLTWH(0, 0, size.width, size.height), 0, pi * 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper is EllipseClipPath &&
        (oldClipper.horizontalPadding != horizontalPadding ||
            oldClipper.verticalPadding != verticalPadding);
  }
}
