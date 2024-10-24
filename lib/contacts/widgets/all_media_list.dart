import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/commun/widgets/contacts_card.dart';

class AllMediaList extends StatefulWidget {
  const AllMediaList({super.key});

  @override
  State<AllMediaList> createState() => _AllMediaListState();
}

class _AllMediaListState extends State<AllMediaList> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && target == 0) {
          setState(() {
            target = 1;
          });
        }
      },
      child: Wrap(
        spacing: 25,
        runSpacing: 10,
        children: [
          const ContactTile(iconPath: 'assets/icons/discord.svg', title: 'discord'),
          const ContactTile(iconPath: 'assets/icons/linkedin.svg', title: 'linkedin'),
          const ContactTile(iconPath: 'assets/icons/gmail.svg', title: 'gmail'),
          const ContactTile(iconPath: 'assets/icons/github.svg', title: 'github'),
          const ContactTile(iconPath: 'assets/icons/telegram.svg', title: 'telegram'),
          const ContactTile(iconPath: 'assets/icons/location.svg', title: 'location'),
          const ContactTile(iconPath: 'assets/icons/card.svg', title: 'card')
        ].animate(interval: 150.milliseconds).fade().move()
      ).animate(target: target).fade(duration: Duration.zero),
    );
  }
}