import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/about_me/widgets/testmonials.dart';
import '../../commun/constents/animations.dart';
import '../../commun/controllers/custom_scroll.dart';
import '/commun/constents/size_status.dart';
import '/commun/widgets/about_me_content.dart';
import '/commun/widgets/skills.dart';
import '/projects/widgets/title.dart';
import '/commun/widgets/contacts_side_bar.dart';
import '/commun/widgets/custom_app_bar.dart';
import '/commun/widgets/footer.dart';


class AboutMeScreen extends GetView<LandingScrollController> {
  const AboutMeScreen({super.key});

  @override
  String? get tag => "about-me-screen";

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
            controller: controller.scrollController,
            child: Stack(
              children: [
                if (screenWidth > 1080) const Positioned(
                  top: 0,
                  left: 40,
                  child: ContactButtonsSideBar(),
                ),
                if (screenWidth > 670) Positioned(
                  left: 0,
                  bottom: 350,
                  child: SvgPicture.asset('assets/decorations/decoration9.svg'),
                ),
                Positioned(
                  top: 160,
                  right: 0,
                  child: SvgPicture.asset('assets/decorations/decoration4.svg'),
                ),
                if (screenWidth > 1080) Positioned(
                  top: 380,
                  left: 0,
                  child: SvgPicture.asset('assets/decorations/decoration11.svg'),
                ),
                Positioned(
                  top: 0,
                  bottom: 100,
                  right: 0,
                  child: Transform.rotate(
                    angle: 3.14,
                    child: SvgPicture.asset('assets/decorations/decoration10.svg')
                  ),
                ),
                if (screenWidth > 670) Positioned(
                  bottom: 220,
                  right: 0,
                  child: SvgPicture.asset('assets/decorations/decoration8.svg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: pagePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            title: 'about-me',
                            subTitle: 'Who am i?',
                            titleFontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 50),
                          AboutMeContent(
                            showReadMoreButton: false,
                            size: screenWidth > 1080
                              ? SizeStatus.large
                              : SizeStatus.medium
                          ),
                          const SizedBox(height: 120),
                          const SectionTitle(
                            title: 'skills',
                            leading: '#',
                          ),
                          const SizedBox(height: 20),
                          const Skills(size: SizeStatus.medium),
                          const SizedBox(height: 120),
                          const SectionTitle(
                            title: 'my-fun-facts',
                            leading: '#',
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              if (screenWidth > 1080) Align(
                                alignment: const Alignment(0.75,0),
                                child: SvgPicture.asset('assets/decorations/decoration12.svg'),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: screenWidth > 670 ? 750 : double.maxFinite),
                                child: const Testimonials()
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth > 670 ? 160 : 100),
                    const Footer()
                  ],
                ),
              ],
            ),
          ),
          GetBuilder<LandingScrollController>(
            id: 'app-bar',
            tag: 'about-me-screen',
            builder: (_) {
              return const CustomAppBar(showSectionsButtons: false).
                animate(target: controller.isAppBarVisible ? 1 : 0).
                addEffects(CustomAnimations.appBarAnimation);
            }
          ),
        ],
      ),
    );
  }
}