import 'package:flutter/material.dart';
class CategoryText extends StatelessWidget {
  final String category;

  const CategoryText(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Customize the text color as needed
        ),
      ),
    );
  }
}
