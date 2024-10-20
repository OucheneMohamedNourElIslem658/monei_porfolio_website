import 'package:flutter/material.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class ContactsText extends StatelessWidget {
  const ContactsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'I’m interested in freelance opportunities. However, if you have other request or question, don’t hesitate to contact me',
      style: TextStyles.style3.copyWith(
        color: CustomColors.grey1
      ),
    );
  }
}