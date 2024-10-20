import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/commun/widgets/vertical_scroller.dart';
import '../../commun/controllers/custom_scroll.dart';
import '/commun/widgets/contact_buttons.dart';
import '/landing/widgets/languages_dropdown.dart';
import '/landing/widgets/logo.dart';
import '/landing/widgets/navigation_button.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      child: VerticalScroller(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 30),
                const Logo(),
                const Spacer(),
                InkWell(
                  onTap: () => Scaffold.of(context).closeDrawer(),
                  overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                  child: SvgPicture.asset("assets/icons/close.svg"),
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: DrawerNavigationButtons(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: LanguagesDropdown(
                size: 32,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            const Center(
              child: ContactButtons(),
            ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}

class DrawerNavigationButtons extends StatelessWidget {
  const DrawerNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingScrollController>(
      id: "navigation-buttons",
      tag: "landing-screen",
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            controller.sections.length, 
            (index) {
              final section = controller.sections[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: NavigationButton(
                  text: section.name,
                  isSelected: section.isSelected,
                  size: 32,
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                    controller.scrollToSection(index);
                  },
                ),
              );
            }
          ),
        );
      }
    );
  }
}