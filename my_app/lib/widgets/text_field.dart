import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData? icon;
  final TextInputType textInputType;
  final double? width; // Added width to control the input width dynamically

  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    this.icon,
    required this.textInputType,
    this.width, // Optional width to customize the TextField's size
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        width: width, // Apply the dynamic width if provided
        child: TextField(
          style: GoogleFonts.outfit(fontSize: 20),
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.black54),
            hintText: hintText,
            hintStyle: GoogleFonts.outfit(color: Colors.black45, fontSize: 18),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: const Color(0xFFedf0f8),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
          keyboardType: textInputType,
          obscureText: isPass,
        ),
      ),
    );
  }
}
