import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.obscureText,
    required this.hintText, this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.textfieldColor,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText ? _isObscure : false,
        decoration: InputDecoration(
          // Background Color
          filled: true,
          fillColor: Color(0xFFF0F4F8),
          // Placeholder Text
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xFFA0AEC0), fontSize: 16),

          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFFA0AEC0),
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,

          // Content Padding
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),

          // Border Styling (Removes the underline/outline)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Color(0xFF4A5568)), // Input text color
      ),
    );
  }
}
