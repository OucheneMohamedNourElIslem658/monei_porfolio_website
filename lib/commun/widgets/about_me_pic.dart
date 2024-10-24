import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/commun/constents/colors.dart';

class AboutMePic extends StatefulWidget {
  const AboutMePic({super.key});

  @override
  State<AboutMePic> createState() => _AboutMePicState();
}

class _AboutMePicState extends State<AboutMePic> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'about-pic',
      child: VisibilityDetector(
        key: GlobalKey(),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.5 && target == 0) {
            setState(() {
              target = 1;
            });
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 470,
              width: 340,
              child: Stack(
                children: [
                  Image.asset('assets/images/hacker2.png')
                    .animate(target: target)
                    .fade()
                    .custom(
                      begin: -150,
                      end: 0,
                      duration: const Duration(milliseconds: 400),
                      builder: (context, value, child) {
                        return Positioned(
                          bottom: value,
                          child: child
                        );
                      },
                    ),
                  Positioned(
                    left: 0,
                    top: 60,
                    child: SvgPicture.asset('assets/decorations/decoration7.svg')
                  ).animate(target: target)
                   .then(delay: 400.milliseconds)
                   .fade(duration: const Duration(milliseconds: 100)),
                  Positioned(
                    right: 18,
                    bottom: 170,
                    child: SvgPicture.asset('assets/decorations/decoration6.svg')
                  ).animate(target: target)
                   .then(delay: 500.milliseconds)
                   .fade(duration: const Duration(milliseconds: 100))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                width: 270,
                height: 1,
                color: CustomColors.purple1,
              ),
            )
          ],
        ),
      ),
    );
  }
}