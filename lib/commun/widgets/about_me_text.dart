import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMeText extends StatefulWidget {
  const AboutMeText({
    super.key, 
    this.showReadMoreButton = true
  });

  final bool showReadMoreButton;

  @override
  State<AboutMeText> createState() => _AboutMeTextState();
}

class _AboutMeTextState extends State<AboutMeText> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    const text = 'Hello, i’m Monei!\n\nI’m a self-taught front-end developer based in Kyiv, Ukraine. I can develop responsive websites from scratch and raise them into modern user-friendly web experiences.\n\nTransforming my creativity and knowledge into a websites has been my passion for over a year. I have been helping various clients to establish their presence online. I always strive to learn about the newest technologies and frameworks.';
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && target == 0) {
          setState(() {
            target = 1;
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText(
                text,
                speed: 5.milliseconds,
                textStyle: TextStyles.style3.copyWith(
                  color: CustomColors.grey1
                ),
              )
            ]
          ),
          const SizedBox(height: 30),
          if (widget.showReadMoreButton) OutlinedButton(
            onPressed: (){}, 
            child: Text(
              'Read more ->',
              style: TextStyles.style3.copyWith(
                color: Colors.white
              ),
            )
          ).animate(delay: (text.length * 5).milliseconds).fade().move()
        ],
      ).animate(target: target).fade(duration: Duration.zero),
    );
  }
}