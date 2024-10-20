import 'package:get/get.dart';

class NavigationController extends GetxController {
  final navigationItems = <NavigationItem>[
    NavigationItem(title: 'home', isSelected: true),
    NavigationItem(title: 'work', isSelected: false),
    NavigationItem(title: 'about-me', isSelected: false),
    NavigationItem(title: 'contacts', isSelected: false),
  ];

  void selectItem(int index) {
    for (var i = 0; i < navigationItems.length; i++) {
      navigationItems[i].isSelected = false;
      if (index == i) {
        navigationItems[i].isSelected = true;
      }
      update(['navigation-buttons']);
    }
  }
}

class NavigationItem {
  bool isSelected;
  final String title;
  NavigationItem({
    required this.title,
    required this.isSelected,
  });
}