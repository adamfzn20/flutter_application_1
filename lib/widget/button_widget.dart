import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Bentuk pinggiran tombol
        ),
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Text(text),
          Opacity(
            opacity: 0.0,
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
