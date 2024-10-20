import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';
import 'package:monei_portfolio/commun/constents/text_styles.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Expanded(child: CustomTextField(label: "Name")),
              SizedBox(width: 15),
              Expanded(child: CustomTextField(label: "Email")),
            ],
          ),
          const SizedBox(height: 15),
          const CustomTextField(label: "Title"),
          const SizedBox(height: 15),
          const CustomTextField(label: "Description", maxLines: 5),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: (){
              if (formKey.currentState!.validate()) {
                
              }
            }, 
            child: const Text(
              'Send',
              style: TextStyles.style2,
            )
          )
        ],
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
    this.validator
  });

  final String label;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
      decoration: InputDecoration(
        enabledBorder: enabledBorders,
        focusedBorder: focusedBorders,
        focusedErrorBorder: errorsBorders,
        errorBorder: errorsBorders,
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