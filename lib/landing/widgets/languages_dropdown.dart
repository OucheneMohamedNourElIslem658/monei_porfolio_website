import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monei_portfolio/landing/controllers/translations.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class LanguagesDropdown extends StatelessWidget {
  const LanguagesDropdown({
    super.key,
    this.size,
    this.onSelected
  });

  final double? size;
  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    final translationsController = Get.put(TranslationsController());
    final supportedLocals = translationsController.supportedLocals;
    final currentLocal = translationsController.currentLocaleString;
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: DropdownButton(
        value: currentLocal,
        underline: const SizedBox(),
        elevation: 1,
        menuWidth: size == null ? 55 : 100,
        focusColor: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        icon: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SvgPicture.asset(
            "assets/icons/arrow_down.svg",
            height: size == null ? null : 10,
          ),
        ),
        items: supportedLocals
            .map((String value) {
          final language = value.split('_').first.toUpperCase();
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              language,
              style: TextStyles.style2.copyWith(
                color: CustomColors.grey1,
                fontSize: size ?? 16
              )
            ),
          );
        }).toList(), 
        onChanged: (value) => translationsController.updateLocal(value),
      ),
    );
  }
}