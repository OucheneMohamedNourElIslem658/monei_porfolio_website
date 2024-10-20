import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/landing/widgets/future_insights_text.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';


class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && target == 0) {
          setState(() {
            target = 1;
          });
        }
      },
      child: IntrinsicWidth(
        child: Column(
          children: [
            SizedBox(
              height: 380,
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/decorations/decoration1.svg')
                      .animate(target: target)
                      .then(delay: const Duration(milliseconds: 1100))
                      .fade(
                        duration: const Duration(milliseconds: 300),
                      )
                      .custom(
                        begin: 50,
                        end: 0,
                        duration: const Duration(milliseconds: 400),
                        builder: (context, value, child) {
                          return Positioned(
                            top: 80,
                            left: value,
                            child: child
                          );
                        },
                      ),
                    Image.asset('assets/images/hacker1.png')
                      .animate(target: target)
                      .then(delay: 400.milliseconds)
                      .fade()
                      .custom(
                        begin: -150,
                        end: 0,
                        duration: const Duration(milliseconds: 600),
                        builder: (context, value, child) {
                          return Positioned(
                            bottom: value,
                            child: child
                          );
                        },
                      ),
                    Positioned(
                      bottom: 60,
                      right: 10,
                      child: SvgPicture.asset('assets/decorations/decoration2.svg')
                        .animate(target: target)
                        .then(delay: const Duration(milliseconds: 1300))
                        .fade()
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColors.grey1
                  ),
                  color: CustomColors.blue1
                ),
                child: Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      color: CustomColors.purple1,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: FutureInsightsText()
                    )
                  ],
                ),
              ).animate()
               .then(delay: 400.milliseconds)
               .fade(duration: const Duration(milliseconds: 400))
            ],
          ),
      ),
    );
  }
}

class DescritionText extends StatelessWidget {
  const DescritionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final skills = [
      'Computer Sience Student',
      'Cross Platform Developer',
      'Web Services Developer'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Monei is an experianced",
          style: TextStyles.style4
        ).animate().fade().move(),
        SizedBox(
          height: screenSize.width > 670 ? 80 : 100,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: List.generate(
              skills.length, 
              (index) => TyperAnimatedText(
                skills[index],
                textStyle: TextStyles.style4.copyWith(
                  color: CustomColors.purple1,
                )
              )
            ),
          ).animate().then(delay: 200.milliseconds).fade().move(),
        ),
        const SizedBox(height: 0),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 530),
          child: Text(
            "He uses the newest and the most evolved tech stacks to build beautiful and complex softwares",
            style: TextStyles.style3.copyWith(
              color: CustomColors.grey1
            )
          ).animate().then(delay: 400.milliseconds).fade().move(),
        ),
        const SizedBox(height: 30),
        OutlinedButton(
          onPressed: (){}, 
          child: const Text(
            "Contact me !!",
            style: TextStyles.style2,
          )
        ).animate().then(delay: 400.milliseconds).fade().move(),
      ],
    );
  }
}