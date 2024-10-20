import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';
import 'package:monei_portfolio/commun/widgets/contact_button.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({
    super.key, 
    this.title,
    this.buttonSize,
    this.spacing
  });

  final String? title;
  final double? buttonSize, spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title!,
            style: TextStyles.style2,
          ),
        ) else const SizedBox(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContactButton(
              iconPath: "assets/icons/github.svg",
              size: buttonSize,
              onPressed: (){},
            ),
            SizedBox(width: spacing ?? 45),
            ContactButton(
              iconPath: "assets/icons/linkedin.svg",
              size: buttonSize,
              onPressed: (){},
            ),
            SizedBox(width: spacing ?? 45),
            ContactButton(
              iconPath: "assets/icons/gmail.svg",
              size: buttonSize,
              onPressed: (){},
            ),
          ],
        ),
      ],
    );
  }
}