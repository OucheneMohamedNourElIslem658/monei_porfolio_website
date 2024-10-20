import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commun/controllers/custom_scroll.dart';
import '/landing/widgets/navigation_button.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingScrollController>(
      id: "navigation-buttons",
      tag: "landing-screen",
      builder: (controller) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            controller.sections.length, 
            (index) {
              final section = controller.sections[index];
              return Padding(
                padding: const EdgeInsets.only(right: 40),
                child: NavigationButton(
                  text: section.name,
                  isSelected: section.isSelected,
                  onPressed: () => controller.scrollToSection(index),
                ),
              );
            }
          ),
        );
      }
    );
  }
}