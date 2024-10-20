import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../commun/constents/animations.dart';
import '../../commun/controllers/custom_scroll.dart';
import '/commun/widgets/footer.dart';
import '/landing/pages/about_me.dart';
import '/landing/pages/contacts.dart';
import '/landing/pages/landing.dart';
import '/landing/pages/projects.dart';
import '/landing/pages/skills.dart';
import '/commun/widgets/custom_app_bar.dart';
import '/landing/widgets/custom_navigation_drawer.dart';

class LandingScreen extends GetView<LandingScrollController> {
  const LandingScreen({super.key});

  @override
  String? get tag => 'landing-screen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const CustomNavigationDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                VisibilityDetector(
                  key: controller.getKeyBySectionName('home'),
                  onVisibilityChanged: (info) => controller.selectSection(info, 'home'),
                  child: const LandingPage(),
                ),
                const SizedBox(height: 30),
                VisibilityDetector(
                  key: controller.getKeyBySectionName('work'),
                  onVisibilityChanged: (info) => controller.selectSection(info, 'work'),
                  child: const Column(
                    children: [
                      SizedBox(height: 70),
                      ProjectsPage(),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: SkillsPage(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                VisibilityDetector(
                  key: controller.getKeyBySectionName('about-me'),
                  onVisibilityChanged: (info) => controller.selectSection(info, 'about-me'),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: AboutMePage(),
                  ),
                ),
                const SizedBox(height: 30),
                VisibilityDetector(
                  key: controller.getKeyBySectionName('contacts'),
                  onVisibilityChanged: (info) => controller.selectSection(info, 'contacts'),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: ContactsPage(),
                      ),
                      SizedBox(height: 50),
                      Footer(),
                    ],
                  ),
                )
              ],
            ),
          ),
          GetBuilder<LandingScrollController>(
            id: 'app-bar',
            tag: 'landing-screen',
            builder: (context) {
              return const CustomAppBar(showSectionsButtons: true).
                animate(target: controller.isAppBarVisible ? 1 : 0).
                addEffects(CustomAnimations.appBarAnimation);
            }
          ),
        ],
      ),
    );
  }
}