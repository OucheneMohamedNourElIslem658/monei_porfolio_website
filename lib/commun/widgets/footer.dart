import 'package:flutter/material.dart';

import '/landing/widgets/personal_info.dart';
import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';
import 'contact_buttons.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    if (screenSize.width > 1080) {
      return const _FooterLarge();
    } else {
      return _FooterMedium(screenSize: screenSize);
    }
  }
}

class _FooterMedium extends StatelessWidget {
  const _FooterMedium({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final screenWidth = screenSize.width;
    double pagePadding = screenWidth > 670 ? 100 : 50;
    return Container(
      color: CustomColors.blue1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: double.maxFinite,
            color: CustomColors.grey1,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (screenWidth > 670) const Row(
                  children: [
                    Expanded(child: PersonalInfo()),
                    SizedBox(width: 30),
                    ContactButtons(
                      buttonSize: 20,
                      spacing: 20,
                      title: 'Media',
                    ),
                  ],
                ) else const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfo(),
                    SizedBox(height: 20),
                    ContactButtons(
                      buttonSize: 20,
                      spacing: 20,
                      title: 'Media',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "© Copyright 2022. Made by Elias",
                    style: TextStyles.style3.copyWith(
                      color: CustomColors.grey1
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _FooterLarge extends StatelessWidget {
  const _FooterLarge();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.blue1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: double.maxFinite,
            color: CustomColors.grey1,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: PersonalInfo(),
                    ),
                    ContactButtons(
                      buttonSize: 20,
                      spacing: 20,
                      title: 'Media',
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "© Copyright 2022. Made by Elias",
                  style: TextStyles.style3.copyWith(
                    color: CustomColors.grey1
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}