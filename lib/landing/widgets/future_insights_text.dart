import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';

import 'package:flutter_animate/flutter_animate.dart';

class FutureInsightsText extends StatelessWidget {
  const FutureInsightsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("landing page").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final info = snapshot.data!.data() as Map<String, dynamic>;
        String profileSentenceLeading = info["profile sentence leading"] ?? "";
        String profileSentenceTrailing = info["profile sentence trailing"] ?? "";
        return Container(
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
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$profileSentenceLeading ",
                        style: TextStyles.style2.copyWith(
                          color: CustomColors.grey1
                        )
                      ),
                      TextSpan(
                        text: profileSentenceTrailing,
                        style: TextStyles.style2
                      )
                    ]
                  )
                )
              )
            ],
          ),
        ).animate()
          .then(delay: 400.milliseconds)
          .fade(duration: const Duration(milliseconds: 400));
      }
    );
  }
}