import 'package:flutter/material.dart';

import '/commun/constents/size_status.dart';
import 'about_me_pic.dart';
import 'about_me_text.dart';

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({
    super.key, 
    required this.size,
    this.showReadMoreButton = true
  });

  final SizeStatus size;
  final bool showReadMoreButton;

  @override
  Widget build(BuildContext context) {
    if (size == SizeStatus.large) {
      return _AboutMeContentLarge(showReadMoreButton: showReadMoreButton);
    } else {
      return _AboutMeContentMedium(showReadMoreButton: showReadMoreButton);
    }
  }
}

class _AboutMeContentMedium extends StatelessWidget {
  const _AboutMeContentMedium({this.showReadMoreButton = true});

  final bool showReadMoreButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FittedBox(
          child: AboutMePic()
        ),
        const SizedBox(height: 30),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 510),
          child: AboutMeText(
            showReadMoreButton: showReadMoreButton,
          ),
        ),
      ],
    );
  }
}

class _AboutMeContentLarge extends StatelessWidget {
  const _AboutMeContentLarge({this.showReadMoreButton = true});

  final bool showReadMoreButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 530),
                  child: AboutMeText(
                    showReadMoreButton: showReadMoreButton,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 30),
        const AboutMePic()
      ],
    );
  }
}