import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article_model.dart';
import '../screens/detail_screen.dart';

class NewsItemCard extends StatelessWidget {
  final Article article;
  const NewsItemCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Just a placeholder date format
    final publishedDate = article.publishedAt.isNotEmpty
        ? article.publishedAt.split('T')[0] // e.g. 2020-02-08
        : 'No Date';

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(article: article)),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            // Image
            SizedBox(
              height: 100,
              width: 120,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
              ),
            ),
            // Title & Date
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      publishedDate, // e.g. 08 February 2020
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
