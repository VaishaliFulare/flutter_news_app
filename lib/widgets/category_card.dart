import 'package:flutter/material.dart';
import '../screens/category_news_screen.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  const CategoryCard({
    Key? key,
    required this.categoryName,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the news screen for this category.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryNewsScreen(
              category: categoryName.toLowerCase(), // Convert to lower-case
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            categoryName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

