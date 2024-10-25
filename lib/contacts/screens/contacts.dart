import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../commun/constents/animations.dart';
import '/commun/widgets/vertical_scroller.dart';
import '../../commun/controllers/custom_scroll.dart';
import '/commun/constents/size_status.dart';
import '/commun/widgets/contacts_content.dart';
import '/commun/widgets/contacts_side_bar.dart';
import '/commun/widgets/custom_app_bar.dart';
import '/commun/widgets/footer.dart';
import '/contacts/widgets/all_media_list.dart';
import '/projects/widgets/title.dart';

class ContactsScreen extends GetView<LandingScrollController> {
  const ContactsScreen({super.key});

  @override
  String? get tag => 'contacts-screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final double pagePadding = screenWidth > 1080 ? 160 : screenWidth > 670 ? 100 : 50;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: VerticalScroller(
        controller: controller.scrollController,
        child: Stack(
          children: [
            if (screenWidth > 1080) const Positioned(
              top: 0,
              left: 40,
              child: ContactButtonsSideBar(),
            ),
            if (screenWidth > 670) Positioned(
              top: 160,
              right: 0,
              child: SvgPicture.asset('assets/decorations/decoration4.svg'),
            ),
            if (screenWidth > 1080) Positioned(
              top: 380,
              left: 0,
              child: SvgPicture.asset('assets/decorations/decoration11.svg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: pagePadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance.collection("suplimentary info").doc("contact").snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                              return const SizedBox();
                            }

                            final data = snapshot.data!.data() as Map<String, dynamic>;
                            String contactQuestion = data["contact question"];
                            return SectionTitle(
                              title: 'Contacts',
                              subTitle: contactQuestion,
                              titleFontWeight: FontWeight.w700,
                            );
                          }
                        ),
                        const SizedBox(height: 50),
                        ContactsContent(status: screenWidth > 1080 ? SizeStatus.large : SizeStatus.medium, showForm: true,),
                        const SizedBox(height: 50),
                        const SectionTitle(
                          title: 'all-media',
                          leading: '#',
                        ),
                        const SizedBox(height: 20),
                        const Expanded(
                          child: AllMediaList()
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                const Footer(),
              ],
            ),
            GetBuilder<LandingScrollController>(
              id: 'app-bar',
              tag: 'contacts-screen',
              builder: (_) {
                return const CustomAppBar(showSectionsButtons: false).
                  animate(target: controller.isAppBarVisible ? 1 : 0).
                  addEffects(CustomAnimations.appBarAnimation);
              }
            ),
          ],
        ),
      ),
    );
  }
}