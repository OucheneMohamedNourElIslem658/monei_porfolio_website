import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onPressed, 
    this.size
  });

  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "#",
              style: TextStyles.style3.copyWith(
                fontSize: size ?? 16
              )
            ),
            TextSpan(
              text: text,
              style: TextStyles.style2.copyWith(
                color: !isSelected
                  ? CustomColors.grey1
                  : Colors.white,
                fontSize: size ?? 16
              )
            )
          ]
        )
      ),
    );
  }
}