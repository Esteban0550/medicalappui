import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconImagePath;
  final String categoryName;

  const CategoryCard({
    super.key,
    required this.iconImagePath,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.deepPurple[100],
          ), // BoxDecoration
          child: Row(
            children: [
              Image.asset(
                iconImagePath, // Use the passed image path
                height: 30,
              ), // Image.asset
              SizedBox(
                width: 10,
              ), // SizedBox
              Text(categoryName), // Use the passed category name
            ],
          ), // Row
        ), // Container
      ), // Padding
    );
  }
}
