import 'package:flutter/material.dart';

class custom_text_feild extends StatelessWidget {
  // final controller = TextEditingController();
  final String labelText;
  final Icon prefixIcon;
  final IconButton? suffexIcon;
  final obSecured;
  final Function(String)? onChanged;
  custom_text_feild(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      this.suffexIcon,
      required this.onChanged,
      this.obSecured = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecured,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Feild required data';
        }
      },
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      //controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        labelText: labelText,
        suffixIconColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffexIcon,
        prefixIconColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
