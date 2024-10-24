import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:monei_portfolio/contacts/widgets/contact_form.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '/commun/constents/size_status.dart';
import '/commun/widgets/contacts_card.dart';
import '/commun/widgets/contacts_text.dart';
import '/commun/widgets/support_card.dart';

class ContactsContent extends StatelessWidget {
  const ContactsContent({
    super.key, 
    required this.status,
    this.showForm = false
  });

  final SizeStatus status;
  final bool showForm;

  @override
  Widget build(BuildContext context) {
    if (status == SizeStatus.large) {
      if (!showForm) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 530),
                child: const ContactsText()
              )
            ),
            const SizedBox(width: 30),
            const ContactsCards(),
          ],
        );
      }

      return const Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: 530,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactsText(),
                      SizedBox(height: 40),
                      ContactsCards(),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: ContactForm()
              )
            ],
          ),
        ],
      );
    } else {
      if (!showForm) {
        return const SizedBox(
          width: 530,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactsText(),
              SizedBox(height: 40),
              ContactsCards(),
            ],
          ),
        );
      }

      return const Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 530,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactsText(),
              SizedBox(height: 50),
              ContactForm(),
              SizedBox(height: 50),
              ContactsCards(),
            ],
          ),
        ),
      );
    }
  }
}

class ContactsCards extends StatefulWidget {
  const ContactsCards({super.key});

  @override
  State<ContactsCards> createState() => _ContactsCardsState();
}

class _ContactsCardsState extends State<ContactsCards> {
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
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          const ContactsCard(),
          const SupportCard(),
        ].animate(interval: 200.milliseconds).fade().move(),
      ).animate(target: target).fade(duration: Duration.zero),
    );
  }
}