import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monei_portfolio/contacts/screens/contacts.dart';

import '/commun/constents/size_status.dart';
import '/commun/widgets/contacts_content.dart';
import '/landing/widgets/page_title.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize.width > 1080) {
      return  const _ContactsPageLarge();
    } else {
      return _ContactsPageMedium(screenSize: screenSize);
    }
  }
}

class _ContactsPageMedium extends StatelessWidget {
  const _ContactsPageMedium({required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double pagePadding = screenSize.width > 670 ? 100 : 50;
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 2,
            child: SvgPicture.asset('assets/decorations/decoration8.svg')
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: 'Cantacts', 
                  dividerFlex: 0.6,
                  onViewAll: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactsScreen())),
                ),
                const SizedBox(height: 30),
                const ContactsContent(status: SizeStatus.medium)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _ContactsPageLarge extends StatelessWidget {
  const _ContactsPageLarge();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 2,
            child: SvgPicture.asset('assets/decorations/decoration10.svg')
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: 'Cantacts', 
                  dividerFlex: 0.6,
                  onViewAll: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactsScreen())),
                ),
                const SizedBox(height: 30),
                const ContactsContent(status: SizeStatus.large),
              ],
            ),
          ),
        ],
      ),
    );
  }
}