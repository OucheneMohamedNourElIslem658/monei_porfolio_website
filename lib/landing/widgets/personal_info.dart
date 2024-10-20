import 'package:flutter/material.dart';

import '/commun/constents/colors.dart';
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
        Wrap(
          children: [
            const Logo(),
            const SizedBox(width: 100),
            Text(
              'm_ouchene@estin.dz',
              style: TextStyles.style3.copyWith(
                color: CustomColors.grey1
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Cross Platform Develper and CS Student',
          style: TextStyles.style3.copyWith(
            color: Colors.white
          ),
        )
      ],
    );
  }
}