import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconImagePath;
  final String categoryName;

  const CategoryCard({
    Key? key,
    required this.iconImagePath, 
    required this.categoryName,
  }) : super(key: key); // Corrección aquí

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.deepPurple[100],
        child: Row(
          children: [
            Image.asset(
              iconImagePath,
              height: 40,
            ),
            SizedBox(width: 10), // Espaciado entre imagen y texto
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
