import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        String text = data["text"];
        text = text.replaceAll(r'\n', '\n\n');
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
    );
  }
}