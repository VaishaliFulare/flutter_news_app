import 'package:flutter/material.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> categories = [
    {"name": "Tech", "image": "assets/tech.png"},
    {"name": "Sport", "image": "assets/spots.png"},
    {"name": "Health", "image": "assets/health.png"},
    {"name": "Fun", "image": "assets/fun.png"},
    {"name": "Science", "image": "assets/science.png"},
    {"name": "General", "image": "assets/general.png"},
    {"name": "Music", "image": "assets/music.png"},
    {"name": "Arts", "image": "assets/arts.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Category'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryName: categories[index]["name"]!,
              imagePath: categories[index]["image"]!,
            );
          },
        ),
      ),
    );
  }
}
