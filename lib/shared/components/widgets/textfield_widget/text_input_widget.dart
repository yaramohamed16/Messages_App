import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.isPassword,
    required this.type,
    this.suffix,
    this.suffixPressed
  });

  final Function(String)? onChanged;
  final String hintText;
  final bool? isPassword;
  final TextInputType type;
  IconData? suffix;
  VoidCallback? suffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword ?? false,
      keyboardType: type,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
