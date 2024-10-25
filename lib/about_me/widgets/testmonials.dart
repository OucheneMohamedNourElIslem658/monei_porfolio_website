import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({super.key});

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("testimonials").where("showOnScreen", isEqualTo: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
          return const SizedBox();
        }

        final testimonials = <String>[];
        for (var doc in snapshot.data!.docs) {
          final testimonial = doc.data() as Map<String, dynamic>;
          final String description = testimonial["description"];
          testimonials.add(description);
        }

        return VisibilityDetector(
          key: GlobalKey(),
          onVisibilityChanged: (info) {
            final animateWidget = (info.visibleFraction > 0.5 && target == 0 || info.visibleFraction * info.size.height > screenSize.height/2) && target == 0;
            if (animateWidget) {
              setState(() {
                target = 1;
              });
            }
          },
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(
              testimonials.length, 
              (index) => FunFactItem(quote: testimonials[index])
            ).animate(
              interval: const Duration(milliseconds: 100)).move().fade()
          ).animate(target: target).fade(duration: Duration.zero),
        );
      }
    );
  }
}

class FunFactItem extends StatelessWidget {
  const FunFactItem({super.key, required this.quote});

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey1),
        color: CustomColors.blue1
      ),
      child: Text(
        quote,
        style: TextStyles.style3.copyWith(
          color: CustomColors.grey1
        ),
      ),
    );
  }
}