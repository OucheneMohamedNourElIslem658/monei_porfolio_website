import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/commun/models/project.dart';

import 'project_card.dart';


class ProjectsList extends StatefulWidget {
  const ProjectsList({
    super.key,
  });

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    final projects = <Project>[
      const Project(
        title: 'Doctor Hunt',
        description: 'Doctors appointement managment',
        imageURL: "https://firebasestorage.googleapis.com/v0/b/ouchenemohamednourelislem.appspot.com/o/projects%2FDoctor%20Hunt.jpg?alt=media&token=7049767b-eecd-437a-9c30-99d647c69090",
        status: ProjectStatus.important,
        techs: "Flutter Dart",
      ),
      const Project(
        title: 'Monkey Type Clone',
        description: 'Typing race platform to enhave typing accurancy',
        imageURL: "https://firebasestorage.googleapis.com/v0/b/ouchenemohamednourelislem.appspot.com/o/projects%2FMonkey%20Type.jpg?alt=media&token=1d780874-4144-4476-b4c8-64a10d9727fb",
        status: ProjectStatus.important,
        techs: "Flutter Dart GetX",
      ),
      const Project(
        title: 'GDSC Game',
        description: 'Fun informative quizz game',
        imageURL: "https://firebasestorage.googleapis.com/v0/b/ouchenemohamednourelislem.appspot.com/o/projects%2FGDSC's%20Game.jpg?alt=media&token=46ab52d6-a937-446e-9b0f-36c1c6a52c55",
        status: ProjectStatus.uncompleted,
        techs: "Flutter Dart GetX",
      ),
      const Project(
        title: 'Mohamed Ouchene',
        description: 'First personal portfolio',
        imageURL: "https://firebasestorage.googleapis.com/v0/b/ouchenemohamednourelislem.appspot.com/o/projects%2FMohamed%20Ouchene.jpg?alt=media&token=4da49284-7e8e-41be-b435-0ab71bd3b107",
        status: ProjectStatus.completed,
        techs: "Flutter Dart GetX",
      ),
      const Project(
        title: 'Kinema',
        description: 'Cinema reservation managment, internal managment and external managmant',
        imageURL: "https://firebasestorage.googleapis.com/v0/b/ouchenemohamednourelislem.appspot.com/o/projects%2Fkinema.jpg?alt=media&token=231f874d-6323-45b9-8f1f-301b9462ead1",
        status: ProjectStatus.important,
        techs: "Flutter Dart Go",
      ),
    ];
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && target == 0) {
          setState(() {
            target = 1;
          });
        }
      },
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
          projects.length, 
          (index) => ProjectCard(
            project: projects[index],
          )
        ).animate(interval: 200.milliseconds).move().fade(),
      ).animate(target: target).fade(duration: Duration.zero),
    );
  }
}