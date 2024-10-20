import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Section {
  late GlobalKey key;
  final String name;
  bool isSelected;

  Section({
    required this.name,
    required this.isSelected,
  }){
    key = GlobalKey();
  }
}

class LandingScrollController extends GetxController {
  late ScrollController scrollController;
  late List<Section> sections;
  var isAppBarVisible = false;

  void initScrollController(){
    scrollController = ScrollController();
    scrollController.addListener(() {
      final scrollDirection = scrollController.position.userScrollDirection;
      isAppBarVisible = !(scrollDirection == ScrollDirection.forward && scrollDirection != ScrollDirection.idle);
      update(['app-bar']);
    });
  }


  void initSections(){
    sections = [
      Section(name: 'home', isSelected: true),
      Section(name: 'work', isSelected: false),
      Section(name: 'about-me', isSelected: false),
      Section(name: 'contacts', isSelected: false),
    ];
  }

  GlobalKey getKeyBySectionName(String sectionName){
    final key = sections.where((element) => element.name == sectionName).first.key;
    return key;
  }

  void scrollToSection(int sectionIndex) async {
    final context = sections[sectionIndex].key.currentContext;
      if (context != null) {
        await Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
  }

  void selectSection(VisibilityInfo visibilityInfo, String sectionName) {
    final visibleFraction = visibilityInfo.visibleFraction;
    final schowedPartHeight = visibleFraction * visibilityInfo.size.height;
    if (schowedPartHeight > Get.size.height/2 || visibleFraction > 0.5) {
      for (var i = 0; i < sections.length; i++) {
        if (sections[i].name == sectionName) {
          sections[i].isSelected = true;
          continue;
        }
        sections[i].isSelected = false;
      }
      update(['navigation-buttons']);
    }
  }

  @override
  void onInit() {
    initSections();
    initScrollController();
    super.onInit();
  }

  @override
  void dispose() {
    Get.delete<LandingScrollController>();
    super.dispose();
  }
}