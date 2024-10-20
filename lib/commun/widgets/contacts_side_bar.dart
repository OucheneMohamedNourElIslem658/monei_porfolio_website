import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';

import 'contact_button.dart';

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
        ContactButton(
          iconPath: "assets/icons/github.svg",
          size: 20,
          onPressed: (){},
        ),
        const SizedBox(height: 18),
        ContactButton(
          iconPath: "assets/icons/linkedin.svg",
          size: 20,
          onPressed: (){},
        ),
        const SizedBox(height: 18),
        ContactButton(
          iconPath: "assets/icons/gmail.svg",
          size: 20,
          onPressed: (){},
        ),
      ],
    );
  }
}