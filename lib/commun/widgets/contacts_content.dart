import 'package:flutter/material.dart';
import 'package:monei_portfolio/contacts/widgets/contact_form.dart';

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

class ContactsCards extends StatelessWidget {
  const ContactsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        ContactsCard(),
        SupportCard(),
      ],
    );
  }
}