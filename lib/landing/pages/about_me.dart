import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monei_portfolio/about_me/screens/about_me.dart';
import 'package:monei_portfolio/commun/constents/size_status.dart';
import 'package:monei_portfolio/landing/widgets/page_title.dart';
import '../../commun/widgets/about_me_content.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width > 1080) {
      return const _AboutMePageLarge();
    } else {
      return _AboutMePageMedium(screenSize: screenSize);
    }
  }
}

class _AboutMePageMedium extends StatelessWidget {
  const _AboutMePageMedium({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final screenWidth = screenSize.width;
    double pagePadding = screenWidth > 670 ? 100 : 50;
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          if (screenWidth > 670) Positioned(
            right: 0,
            bottom: 90,
            child: SvgPicture.asset('assets/decorations/decoration8.svg')
          ),
          if (screenWidth < 1080 && screenWidth > 470) Positioned(
            right: 0,
            top: 130,
            child: SvgPicture.asset('assets/decorations/decoration4.svg')
          ),
          if (screenWidth > 1080) Positioned(
            left: 0,
            bottom: 220,
            child: SvgPicture.asset('assets/decorations/decoration9.svg')
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: 'about me',
                  dividerFlex: 0.6,
                  onViewAll: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutMeScreen()))
                ),
                const SizedBox(height: 30),
                const AboutMeContent(size: SizeStatus.medium),
              ]
            )
          )
        ],
      ),
    );
  }
}

class _AboutMePageLarge extends StatelessWidget {
  const _AboutMePageLarge();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 90,
            child: SvgPicture.asset('assets/decorations/decoration8.svg')
          ),
          Positioned(
            left: 0,
            bottom: 220,
            child: SvgPicture.asset('assets/decorations/decoration9.svg')
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: 'about me',
                  dividerFlex: 0.6,
                  onViewAll: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutMeScreen())),
                ),
                const AboutMeContent(size: SizeStatus.large),
              ]
            )
          )
        ],
      ),
    );
  }
}