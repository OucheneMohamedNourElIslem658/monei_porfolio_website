import 'package:flutter/material.dart';

import '/commun/constents/colors.dart';
import '/commun/widgets/contacts_card.dart';

class ContactButtonsSideBar extends StatelessWidget {
  const ContactButtonsSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          width: 1,
          color: CustomColors.grey1,
        ),
        const SizedBox(height: 18),
        const ContactTile(
          iconPath: "assets/icons/github.svg",
          title: "github",
          size: 20,
          showTitle: false,
        ),
        const SizedBox(height: 18),
        const ContactTile(
          iconPath: "assets/icons/linkedin.svg",
          title: "linkedin",
          showTitle: false,
          size: 20,
        ),
        const SizedBox(height: 18),
        const ContactTile(
          iconPath: "assets/icons/gmail.svg",
          title: "gmail",
          size: 20,
          showTitle: false,
        ),
      ],
    );
  }
}