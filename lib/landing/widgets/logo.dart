import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/commun/constents/text_styles.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final String logoText = data["logo text"] ?? "";
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/logo.svg"),
            const SizedBox(width: 8),
            Text(
              logoText,
              style: TextStyles.style1,
            )
          ],
        );
      }
    );
  }
}