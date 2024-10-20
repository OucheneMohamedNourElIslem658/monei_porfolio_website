import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.iconPath,
    this.size,
    required this.onPressed
  });

  final String iconPath;
  final double? size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: SvgPicture.asset(
        iconPath,
        width: size ?? 50,
      ),
    );
  }
}