import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monei_portfolio/commun/constents/size_status.dart';

import '../../commun/widgets/skills.dart';
import '/landing/widgets/page_title.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize.width > 1080) {
      return const _SkillsPageLarge();
    } else {
      return _SkillsPageMedium(screenSize);
    }
  }
}

class _SkillsPageMedium extends StatelessWidget {
  const _SkillsPageMedium(this.screenSize);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double pagePadding = screenSize.width > 670 ? 100 : 50;
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          if (screenSize.width > 470) Positioned(
            bottom: 0,
            right: 10,
            child:  SvgPicture.asset(
              'assets/decorations/decoration5.svg',
              width: 200,
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageTitle(
                  title: 'skills', 
                  dividerFlex: 0.25
                ),
                const SizedBox(height: 12),
                const SizedBox(
                  width: double.maxFinite,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Skills(size: SizeStatus.medium)
                  ),
                ),
                if (screenSize.width > 470) 
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillsPageLarge extends StatelessWidget {
  const _SkillsPageLarge();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(
              title: 'skills', 
              dividerFlex: 0.25
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SvgPicture.asset('assets/decorations/decoration5.svg'),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Skills()
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}