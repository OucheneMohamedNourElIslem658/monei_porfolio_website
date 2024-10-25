import 'package:flutter/material.dart';

import '/commun/constents/text_styles.dart';
import '/commun/widgets/contacts_card.dart';

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
            ContactTile(
              iconPath: "assets/icons/github.svg",
              title: "github",
              size: buttonSize,
              showTitle: false,
            ),
            SizedBox(width: spacing ?? 45),
            ContactTile(
              iconPath: "assets/icons/linkedin.svg",
              title: "linkedin",
              showTitle: false,
              size: buttonSize,
            ),
            SizedBox(width: spacing ?? 45),
            ContactTile(
              iconPath: "assets/icons/gmail.svg",
              title: "gmail",
              size: buttonSize,
              showTitle: false,
            ),
          ],
        ),
      ],
    );
  }
}