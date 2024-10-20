import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';

class FutureInsightsText extends StatelessWidget {
  const FutureInsightsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Currently learning ",
            style: TextStyles.style2.copyWith(
              color: CustomColors.grey1
            )
          ),
          const TextSpan(
            text: "Microservices and CI/CD",
            style: TextStyles.style2
          )
        ]
      )
    );
  }
}