// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monei_portfolio/about_me/utils/messangers.dart';

class TestimonialsController extends GetxController {
  late TextEditingController subjectController;
  late TextEditingController descriptionController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    subjectController = TextEditingController();
    descriptionController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    subjectController.dispose();
    descriptionController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.onClose();
  }

  String? validateSubject(String? value) {
    if (value == null || value.isEmpty) return 'Subject is required';
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) return 'Description is required';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!GetUtils.isEmail(value)) return 'Enter a valid email';
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    return null;
  }

  var isFormEnabled = true;
  Future<bool> validateForm(BuildContext context) async {
    isFormEnabled = false;
    update(["form"]);

    final form = formKey.currentState;
    try {
      if (form != null && form.validate()) {
        await FirebaseFirestore.instance.collection('testimonials').add({
          'title': subjectController.text.trim(),
          'email': emailController.text.trim(),
          'description': descriptionController.text.trim(),
          'showOnScreen': false,
          "name": nameController.text.trim()
        });
        clearForm();
        Messangers.snackBar(
          context, 
          message: "Message sent successfully!",
        );
        return true;
      }
      return false;
    } catch (e) {
      Messangers.snackBar(
        context, 
        message: "Error occured. Please try another media.",
        eventStatus: EventStatus.fail
      );
    } finally {
      isFormEnabled = true;
      update(["form"]);
    }

    return false;
  }

  void clearForm() {
    subjectController.clear();
    descriptionController.clear();
    emailController.clear();
    nameController.clear();
  }
}
