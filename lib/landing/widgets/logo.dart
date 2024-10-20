import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/commun/constents/text_styles.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/icons/logo.svg"),
        const SizedBox(width: 8),
        const Text(
          "Monei",
          style: TextStyles.style1,
        )
      ],
    );
  }
}