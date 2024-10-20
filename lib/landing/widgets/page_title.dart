import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key, 
    required this.title, 
    this.dividerFlex = 0.5,
    this.onViewAll
  });

  final String title;
  final double dividerFlex;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    final dividerFlexInt = (dividerFlex * 100).toInt().clamp(1, 99);
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "#",
                style: TextStyles.style5.copyWith(
                  color: CustomColors.purple1
                )
              ),
              TextSpan(
                text: title,
                style: TextStyles.style5
              )
            ]
          )
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: dividerFlexInt,
          child: Container(
            height: 1,
            color: CustomColors.purple1,
          ),
        ),
        Spacer(flex: (100 - dividerFlexInt)),
        if (onViewAll != null) InkWell(
          onTap: onViewAll,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: const Text(
            'View all ~~>',
            style: TextStyles.style2,
          ),
        )
      ],
    );
  }
}