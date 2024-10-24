import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/commun/models/project.dart';

import 'project_card.dart';


class ProjectsList extends StatefulWidget {
  const ProjectsList({
    super.key,
    this.type
  });

  final String? type;

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
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
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("projects").where("status", arrayContains: widget.type).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
            return const SizedBox();
          }

          final docs = snapshot.data!.docs;
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              docs.length, 
              (index) {
                final doc = docs[index];
                final data = doc.data() as Map<String, dynamic>;
                final techs = (data["techs"] as List<dynamic>).join(" ");
                final String description = data["description"];
                final String title = data["title"];
                final String imageURL = data["imageURL"];
                final project = Project(
                  imageURL: imageURL,
                  techs: techs, 
                  title: title, 
                  description: description, 
                );
                return ProjectCard(
                project: project,
              );
              }
            ).animate(interval: 200.milliseconds).move().fade(),
          ).animate(target: target).fade(duration: Duration.zero);
        }
      ),
    );
  }
}