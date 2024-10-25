import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';
import 'package:monei_portfolio/contacts/controllers/testmonial.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  double target = 0;
  @override
  Widget build(BuildContext context) {
    final testimonialController = Get.put(TestimonialsController(), tag: 'form');
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5 && target == 0) {
          setState(() {
            target = 1;
          });
        }
      },
      child: GetBuilder<TestimonialsController>(
        tag: 'form',
        id: "form",
        builder: (_) {
          return Form(
            key: testimonialController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: "Name",
                        controller: testimonialController.nameController,
                        validator: (value) => testimonialController.validateName(value),
                        enabled: testimonialController.isFormEnabled,
                      )
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomTextField(
                        label: "Email",
                        controller: testimonialController.emailController,
                        validator: (value) => testimonialController.validateEmail(value),
                        enabled: testimonialController.isFormEnabled,
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: "Subject",
                  controller: testimonialController.subjectController,
                  validator: (value) => testimonialController.validateSubject(value),
                  enabled: testimonialController.isFormEnabled,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: "Description", 
                  controller: testimonialController.descriptionController,
                  maxLines: 5,
                  validator: (value) => testimonialController.validateDescription(value),
                  enabled: testimonialController.isFormEnabled,
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  onPressed: testimonialController.isFormEnabled ? () async => await testimonialController.validateForm(context) : null, 
                  child: const Text(
                    'Send',
                    style: TextStyles.style2,
                  )
                )
              ].animate(interval: const Duration(milliseconds: 80)).fade().move()
            ).animate(target: target).fade(duration: Duration.zero),
          );
        }
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, 
    required this.label, 
    this.maxLines,
    this.controller, 
    this.validator,
    this.enabled = true
  });

  final String label;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    const focusedBorders = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.zero
    );
    const enabledBorders = OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.grey1),
      borderRadius: BorderRadius.zero
    );
    const errorsBorders = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.zero
    );
    return TextFormField(
      controller: controller,
      validator: validator ?? (value) {
        if ((value ?? "").length <= 10) {
          return 'The $label must be at least of 10 caracters';
        }
        return null;
      },
      maxLines: maxLines,
      style: TextStyles.style3.copyWith(
        color: Colors.white
      ),
      cursorColor: CustomColors.purple1,
      enabled: enabled,
      decoration: InputDecoration(
        enabledBorder: enabledBorders,
        focusedBorder: focusedBorders,
        focusedErrorBorder: errorsBorders,
        errorBorder: errorsBorders,
        disabledBorder: enabledBorders,
        focusColor: Colors.white,
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.all(8),
        labelText: label,
        labelStyle: TextStyles.style3.copyWith(
          color: CustomColors.grey1
        ),
        floatingLabelStyle: TextStyles.style3.copyWith(
          color: Colors.white
        ),
        errorStyle: TextStyles.style3.copyWith(
          color: Colors.red,
          fontSize: 12
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}