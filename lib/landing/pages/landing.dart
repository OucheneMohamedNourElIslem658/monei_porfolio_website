import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import '/commun/widgets/contacts_side_bar.dart';
import '/landing/widgets/profile_pic.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize.width > 1080) {
      return __LandingPageLarge(screenSize: screenSize);
    } else {
      return _LandingPageMedium(screenSize: screenSize);
    }
  }
}

class _LandingPageMedium extends StatelessWidget {
  const _LandingPageMedium({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width > 670 ? 100 : 50
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: ProfilePic()
                    ),
                    SizedBox(height: 30),
                    DescritionText(),
                  ],
                ),
                SizedBox(height: 70),
                Align(
                  alignment: Alignment(0.3, 0),
                  child: Quote()
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: screenSize.width > 670 ? 50 : 150,
            child: SvgPicture.asset('assets/decorations/decoration3.svg')
          )
        ],
      ),
    );
  }
}

class Quote extends StatefulWidget {
  const Quote({
    super.key,
  });

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
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
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("suplimentary info").doc("landing page").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
            return const SizedBox();
          }

          final info = snapshot.data!.data() as Map<String, dynamic>;
          String quote = info["quote"];
          String quoter = info["quoter"];
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.grey1
                      )
                    ),
                    child: AnimatedTextKitWithTarget(
                      animateText: target == 1,
                      animatedTextKit: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            quote,
                            speed: 20.milliseconds,
                            textStyle: TextStyles.style2
                          ),
                        ]
                      )
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: CustomColors.grey1),
                        left: BorderSide(color: CustomColors.grey1),
                        right: BorderSide(color: CustomColors.grey1)
                      )
                    ),
                    child: Text(
                      quoter,
                      style: TextStyles.style2,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  color: CustomColors.blue1,
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset('assets/icons/double_comma.svg'),
                ),
              ),
              Positioned(
                bottom: 35,
                right: 10,
                child: Container(
                  color: CustomColors.blue1,
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset('assets/icons/double_comma.svg'),
                ),
              ),
            ],
          ).animate(target: target).fade();
        }
      ),
    );
  }
}

class AnimatedTextKitWithTarget extends StatelessWidget {
  const AnimatedTextKitWithTarget({
    super.key, 
    required this.animatedTextKit, 
    this.placeHolder,
    this.animateText = true,
    this.delayed = Duration.zero
  });
  

  final AnimatedTextKit animatedTextKit;
  final Widget? placeHolder;
  final bool animateText;
  final Duration delayed;

  @override
  Widget build(BuildContext context) {
    if (animateText) {
      return FutureBuilder(
        future: Future.delayed(delayed),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return placeHolder ?? const SizedBox();
          }
          return animatedTextKit;
        }
      );
    } else {
      return placeHolder ?? const SizedBox();
    }
  }
}

class __LandingPageLarge extends StatelessWidget {
  const __LandingPageLarge({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints(minHeight: screenSize.height),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 40,
            child: const ContactButtonsSideBar().animate().move().fade()
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(child: DescritionText()),
                    SizedBox(width: 30),
                    ProfilePic()
                  ],
                ),
                SizedBox(height: 70),
                Align(
                  alignment: const Alignment(0.3, 0),
                  child: Quote()
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 50,
            child: SvgPicture.asset('assets/decorations/decoration3.svg').animate()
          )
        ],
      ),
    );
  }
}
