


import 'package:flutter/material.dart';

class TextEditor extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const TextEditor({super.key, this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[500]),
        hintText: hintText,
      ),
    ) ;
  }
}
