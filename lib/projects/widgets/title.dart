import 'package:flutter/material.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.leading,
    this.subTitle,
    this.titleFontWeight
  });

  final String? leading, subTitle;
  final FontWeight? titleFontWeight;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: leading ?? '/',
                style: TextStyles.style5.copyWith(
                  color: CustomColors.purple1,
                  fontWeight: titleFontWeight
                )
              ),
              TextSpan(
                text: title,
                style: TextStyles.style5.copyWith(
                  fontWeight: titleFontWeight
                )
              ),
            ]
          ),
        ),

        if (subTitle != null) Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            subTitle!,
            style: TextStyles.style3.copyWith(
              color: CustomColors.grey1
            ),
          ),
        ) else const SizedBox(),
      ],
    );
  }
}