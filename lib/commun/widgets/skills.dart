import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/commun/constents/size_status.dart';
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

class _SkillsMedium extends StatefulWidget {
  const _SkillsMedium();

  @override
  State<_SkillsMedium> createState() => _SkillsMediumState();
}

class _SkillsMediumState extends State<_SkillsMedium> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        final animateWidget = ((info.visibleFraction > 0.5 && target == 0) || info.visibleFraction * info.size.height > screenSize.height/2) && target == 0;
        if (animateWidget) {
          setState(() {
            target = 1;
          });
        }
      },
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          const LanguagesCategory(),
          const FrameworksCategory(),
          const ServicesCategory(),
          const ToolsCategory(),
          const OtherCategory(),
        ]
        .animate(interval: 200.milliseconds).move().fade()
      ).animate(target: target).fade(duration: Duration.zero),
    );
  }
}

class _SkillsLarge extends StatefulWidget {
  const _SkillsLarge();

  @override
  State<_SkillsLarge> createState() => _SkillsLargeState();
}

class _SkillsLargeState extends State<_SkillsLarge> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && target == 0) {
          setState(() {
            target = 1;
          });
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const LanguagesCategory()
            .animate(target: target)
            .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
            .fade(),
          const SizedBox(width: 15),
          Column(
            children: [
              const FrameworksCategory()
                .animate(target: target)
                .then(delay: 200.milliseconds)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
                .fade(),
              const SizedBox(height: 15),
              const OtherCategory()
                .animate(target: target)
                .then(delay: 400.milliseconds)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
                .fade(),
            ],
          ),
          const SizedBox(width: 15),
          Column(
            children: [
              const ServicesCategory()
                .animate(target: target)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
                .fade(),
              const SizedBox(height: 15),
              const ToolsCategory()
                .animate(target: target)
                .then(delay: 200.milliseconds)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1))
                .fade(),
            ],
          )
        ],
      ),
    );
  }
}

class LanguagesCategory extends StatelessWidget {
  const LanguagesCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").collection("skills").doc("languages").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final info = snapshot.data!.data() as Map<String, dynamic>;
        final languages = info["languages"] as List<dynamic>;

        return SkillCategory(
          title: snapshot.data!.id,
          skills: languages,
        );
      }
    );
  }
}

class FrameworksCategory extends StatelessWidget {
  const FrameworksCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").collection("skills").doc("frameworks").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final info = snapshot.data!.data() as Map<String, dynamic>;
        final frameworks = info["framworks"] as List<dynamic>;

        return SkillCategory(
          title: snapshot.data!.id,
          skills: frameworks,
        );
      }
    );
  }
}

class OtherCategory extends StatelessWidget {
  const OtherCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").collection("skills").doc("other").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final info = snapshot.data!.data() as Map<String, dynamic>;
        final other = info["Other"] as List<dynamic>;

        return SkillCategory(
          title: snapshot.data!.id,
          skills: other,
        );
      }
    );
  }
}

class ServicesCategory extends StatelessWidget {
  const ServicesCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").collection("skills").doc("databases & services").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final info = snapshot.data!.data() as Map<String, dynamic>;
        final services = info["Databases & Services"] as List<dynamic>;

        return SkillCategory(
          title: snapshot.data!.id,
          skills: services,
        );
      }
    );
  }
}

class ToolsCategory extends StatelessWidget {
  const ToolsCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("suplimentary info").doc("about me").collection("skills").doc("tools").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final info = snapshot.data!.data() as Map<String, dynamic>;
        final services = info["Tools"] as List<dynamic>;

        return SkillCategory(
          title: snapshot.data!.id,
          skills: services,
        );
      }
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
  final List<dynamic> skills;

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