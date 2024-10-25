import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
            title: 'gmail',
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
    this.showTitle = true,
    this.size
  });

  final String iconPath, title;
  final bool showTitle;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("contact").collection("media").doc(title.toLowerCase()).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        String? description = data["description"];
        String? link = data["link"];
        return InkWell(
          onTap: link == null ? null : () => launchUrl(Uri.parse(link)),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(iconPath, width: size,),
              const SizedBox(width: 10),
              if (showTitle) Flexible(
                child: Text(
                  description ?? title,
                  style: TextStyles.style3.copyWith(
                    color: CustomColors.grey1
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}