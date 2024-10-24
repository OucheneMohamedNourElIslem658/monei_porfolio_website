import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/commun/constents/animations.dart';
import '../../commun/controllers/custom_scroll.dart';
import '/projects/widgets/title.dart';
import '../../commun/widgets/projects_list.dart';
import '/commun/widgets/contacts_side_bar.dart';
import '/commun/widgets/footer.dart';
import '/commun/widgets/custom_app_bar.dart';

class ProjectsScreen extends GetView<LandingScrollController> {
  const ProjectsScreen({super.key});

  @override
  String? get tag => 'projects-screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final double pagePadding = screenWidth > 1080 ? 160 : screenWidth > 670 ? 100 : 50;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                if (screenWidth > 1080) const Positioned(
                  top: 0,
                  left: 40,
                  child: ContactButtonsSideBar(),
                ),
                Positioned(
                  left: 0,
                  bottom: 450,
                  child: SvgPicture.asset('assets/decorations/decoration10.svg'),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: SvgPicture.asset('assets/decorations/decoration9.svg'),
                ),
                Positioned(
                  top: 160,
                  right: 0,
                  child: SvgPicture.asset('assets/decorations/decoration4.svg'),
                ),
                Positioned(
                  top: 380,
                  left: 0,
                  child: SvgPicture.asset('assets/decorations/decoration11.svg'),
                ),
                Positioned(
                  top: 300,
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/decorations/decoration8.svg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: pagePadding),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(
                            title: 'projects',
                            subTitle: 'List of my projects',
                            titleFontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 50),
                          SectionTitle(
                            title: 'complete-apps',
                            leading: '#',
                          ),
                          SizedBox(height: 20),
                          ProjectsList(type: "completed"),
                          SizedBox(height: 50),
                          SectionTitle(
                            title: 'small-projects',
                            leading: '#',
                          ),
                          SizedBox(height: 20),
                          ProjectsList(type: "uncompleted"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Footer()
                  ],
                ),
              ],
            ),
          ),
          GetBuilder<LandingScrollController>(
            id: 'app-bar',
            tag: 'projects-screen',
            builder: (_) {
              return const CustomAppBar(showSectionsButtons: false,).
                animate(target: controller.isAppBarVisible ? 1 : 0).
                addEffects(CustomAnimations.appBarAnimation);
            }
          ),
        ],
      ),
    );
  }
}