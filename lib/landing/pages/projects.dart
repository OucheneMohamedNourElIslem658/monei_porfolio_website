import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/commun/widgets/projects_list.dart';
import '/projects/screens/projects.dart';
import '/landing/widgets/page_title.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double pagePadding = screenWidth > 1080 ? 160 : screenWidth > 670 ? 100 : 50;

    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints(minHeight: screenHeight),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: 'projects', 
                  onViewAll: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProjectsScreen())),
                  dividerFlex: 0.6,
                ),
                const SizedBox(height: 50),
                const ProjectsList(type: "important")
              ],
            ),
          ),
          if (screenWidth > 470) Positioned(
            right: 0,
            bottom: 50,
            child: SvgPicture.asset('assets/decorations/decoration4.svg')
          ) else const SizedBox()
        ],
      ),
    );
  }
}