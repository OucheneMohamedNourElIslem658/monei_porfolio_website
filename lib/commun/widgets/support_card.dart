import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';
import 'package:monei_portfolio/commun/widgets/contacts_card.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 250),
      decoration: BoxDecoration(
        color: CustomColors.blue1,
        border: Border.all(color: CustomColors.grey1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support me here',
            style: TextStyles.style3.copyWith(
              color: Colors.white
            ),
          ),
          const SizedBox(height: 20),
          const ContactTile(
            iconPath: 'assets/icons/card.svg', 
            title: 'card'
          )
        ],
      ),
    );
  }
}