import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/widgets/contacts_card.dart';

import '/commun/constents/text_styles.dart';
import '/landing/widgets/logo.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Wrap(
          children: [
            Logo(),
            SizedBox(width: 100),
            ContactTile(iconPath: "assets/icons/gmail.svg", title: "gmail")
          ],
        ),
        const SizedBox(height: 8),
        StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            final data = snapshot.data!.data() as Map<String, dynamic>;
            final String role = data["role"] ?? "";
            return Text(
              role,
              style: TextStyles.style3.copyWith(
                color: Colors.white
              ),
            );
          }
        )
      ],
    );
  }
}

class CopyRightInfo extends StatelessWidget {
  const CopyRightInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").snapshots(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox();
      }
    
      final data = snapshot.data!.data() as Map<String, dynamic>;
      final String copyRightText = data["copy right text"] ?? "";
        return Center(
          child: Text(
            copyRightText,
            textAlign: TextAlign.center,
            style: TextStyles.style3.copyWith(
              color: CustomColors.grey1
            ),
          ),
        );
      }
    );
  }
}