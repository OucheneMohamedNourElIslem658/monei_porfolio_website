import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class ContactsText extends StatefulWidget {
  const ContactsText({
    super.key,
  });

  @override
  State<ContactsText> createState() => _ContactsTextState();
}

class _ContactsTextState extends State<ContactsText> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("contact").snapshots(),
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
          child: SizedBox(
            height: 90,
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText(
                  text,
                  textStyle: TextStyles.style3.copyWith(
                    color: CustomColors.grey1
                  ),
                  speed: const Duration(milliseconds: 5),
                ),
              ],
            ),
          ).animate(target: target).fade(duration: Duration.zero),
        );
      }
    );
  }
}