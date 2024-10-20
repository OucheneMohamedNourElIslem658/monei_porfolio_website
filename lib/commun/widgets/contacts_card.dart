import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class ContactsCard extends StatelessWidget {
  const ContactsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 250),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey1),
        color: CustomColors.blue1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message me here',
            style: TextStyles.style3.copyWith(
              color: Colors.white
            ),
          ),
          const SizedBox(height: 20),
          const ContactTile(
            title: 'Discord',
            iconPath: 'assets/icons/discord.svg',
          ),
          const SizedBox(height: 10),
          const ContactTile(
            title: 'm_ouchene@estin.dz',
            iconPath: 'assets/icons/gmail.svg',
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key, 
    required this.iconPath, 
    required this.title,
  });

  final String iconPath, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            title,
            style: TextStyles.style3.copyWith(
              color: CustomColors.grey1
            ),
          ),
        )
      ],
    );
  }
}