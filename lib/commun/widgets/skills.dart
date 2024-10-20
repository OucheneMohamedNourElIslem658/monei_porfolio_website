import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/size_status.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
    this.size = SizeStatus.large
  });

  final SizeStatus size;

  @override
  Widget build(BuildContext context) {
    if (size == SizeStatus.large) {
      return const _SkillsLarge();
    } else {
      return const _SkillsMedium();
    }
  }
}

class _SkillsMedium extends StatelessWidget {
  const _SkillsMedium();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        LanguagesCategory(),
        FrameworksCategory(),
        ServicesCategory(),
        ToolsCategory(),
        OtherCategory(),
      ],
    );
  }
}

class _SkillsLarge extends StatelessWidget {
  const _SkillsLarge();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        LanguagesCategory(),
        SizedBox(width: 15),
        Column(
          children: [
            FrameworksCategory(),
            SizedBox(height: 15),
            OtherCategory(),
          ],
        ),
        SizedBox(width: 15),
        Column(
          children: [
            ServicesCategory(),
            SizedBox(height: 15),
            ToolsCategory(),
          ],
        )
      ],
    );
  }
}

class LanguagesCategory extends StatelessWidget {
  const LanguagesCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SkillCategory(
      title: 'Languages',
      skills: ['Dart', 'Go', 'SQL', 'JavaScript', 'C', 'Python', 'Java'],
    );
  }
}

class FrameworksCategory extends StatelessWidget {
  const FrameworksCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SkillCategory(
      title: 'Frameworks',
      skills: ['Flutter', 'GetX', 'Cobra', 'Express'],
    );
  }
}

class OtherCategory extends StatelessWidget {
  const OtherCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SkillCategory(
      title: 'Other',
      skills: ['Docker', 'GCP', 'Render'],
    );
  }
}

class ServicesCategory extends StatelessWidget {
  const ServicesCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SkillCategory(
      title: 'Databases & Services',
      skills: ['MySQL', 'PostgreSQL', 'Firebase'],
    );
  }
}

class ToolsCategory extends StatelessWidget {
  const ToolsCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SkillCategory(
      title: 'Tools',
      skills: ['VSCode', 'AndroidStudio', 'Git', 'Github', 'Linux'],
    );
  }
}

class SkillCategory extends StatelessWidget {
  const SkillCategory({
    super.key, 
    required this.title,
    required this.skills, 
  });

  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    var divider = Container(
      width: double.infinity,
      height: 1,
      color: CustomColors.grey1,
    );
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey1),
        color: CustomColors.blue1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title,
              style: TextStyles.style2,
            ),
          ),
          const SizedBox(height: 5),
          divider,
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Wrap(
              children: List.generate(
                skills.length, 
                (index) => Text(
                  "${skills[index]} ",
                  style: TextStyles.style3.copyWith(
                    color: CustomColors.grey1
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}