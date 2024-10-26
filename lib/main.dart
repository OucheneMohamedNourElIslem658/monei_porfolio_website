import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monei_portfolio/landing/screens/landing.dart';

import '/firebase_options.dart';
import '/commun/controllers/custom_scroll.dart';
import '/commun/utils/theme.dart';
import '/landing/controllers/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      translations: CustomTranslations(),
      locale: const Locale('en', "US"),
      home: const LandingScreen(),
      initialBinding: BindingsBuilder((){
        Get.lazyPut(() => LandingScrollController(), tag: 'landing-screen');
        Get.lazyPut(() => LandingScrollController(), tag: 'about-me-screen');
        Get.lazyPut(() => LandingScrollController(), tag: 'contacts-screen');
        Get.lazyPut(() => LandingScrollController(), tag: 'projects-screen');
      }),
    );
  }
}