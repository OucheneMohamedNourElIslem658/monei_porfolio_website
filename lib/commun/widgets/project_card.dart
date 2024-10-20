import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/models/project.dart';

import '/commun/constents/colors.dart';
import '/commun/constents/text_styles.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,  
    required this.project, 
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    var divider = Container(
      width: double.infinity,
      height: 1,
      color: CustomColors.grey1,
    );
    return Container(
      width: 330,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (project.imageURL != null) Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(project.imageURL!),
                onError: (exception, stackTrace) => const SizedBox(),
                fit: BoxFit.cover,
              )
            ),
          ) else const SizedBox(),
          if (project.imageURL != null) divider 
          else const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              project.techs,
              style: TextStyles.style3.copyWith(
                color: CustomColors.grey1
              ),
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: TextStyles.style6,
                ),
                const SizedBox(height: 10),
                Text(
                  project.description,
                  style: TextStyles.style3.copyWith(
                    color: CustomColors.grey1
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: (){}, 
                      child: const Text(
                        "Live <~>",
                        style: TextStyles.style2,
                      )
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: (){}, 
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: CustomColors.grey1
                        )
                      ),
                      child: Text(
                        "Cached >=",
                        style: TextStyles.style2.copyWith(
                          color: CustomColors.grey1
                        )
                      )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}