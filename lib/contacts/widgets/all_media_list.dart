import 'package:flutter/material.dart';

import '/commun/widgets/contacts_card.dart';

class AllMediaList extends StatelessWidget {
  const AllMediaList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 25,
      runSpacing: 10,
      children: [
        ContactTile(iconPath: 'assets/icons/discord.svg', title: 'discord'),
        ContactTile(iconPath: 'assets/icons/linkedin.svg', title: 'linkedin'),
        ContactTile(iconPath: 'assets/icons/gmail.svg', title: 'gmail'),
        ContactTile(iconPath: 'assets/icons/github.svg', title: 'github'),
        ContactTile(iconPath: 'assets/icons/telegram.svg', title: 'telegram'),
        ContactTile(iconPath: 'assets/icons/location.svg', title: 'location'),
        ContactTile(iconPath: 'assets/icons/card.svg', title: 'card')
      ],
    );
  }
}