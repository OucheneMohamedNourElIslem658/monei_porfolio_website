import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/commun/constents/colors.dart';
import '/landing/widgets/logo.dart';
import '/landing/widgets/navigation_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, 
    required this.showSectionsButtons
  });

  final bool showSectionsButtons;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 1080) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: CustomColors.blue1,
        scrolledUnderElevation: 0.001,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              const SizedBox(width: 30),
              const Logo(),
              const Spacer(),
              if (showSectionsButtons) InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_){
      if (Scaffold.of(context).isDrawerOpen) {
        Scaffold.of(context).closeDrawer();
      }
    });

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      shadowColor: CustomColors.blue1,
      scrolledUnderElevation: 0.001,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
        child: Row(
          children: [
            const Logo(),
            const Spacer(flex: 4),
            if (showSectionsButtons) const CustomNavigationBar(),
            // const LanguagesDropdown(),
          ],
        ),
      ),
    );
  }
}