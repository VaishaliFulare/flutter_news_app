import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final publishedDate = article.publishedAt.isNotEmpty
        ? article.publishedAt.split('T')[0]
        : 'No Date';

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // handle favorite
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // News Image
            CachedNetworkImage(
              imageUrl: article.urlToImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            // Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                publishedDate,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(article.content.isNotEmpty
                  ? article.content
                  : article.description),
            ),
            const SizedBox(height: 20),
            // Read Full Article
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse(article.url);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: const Text('Read Full Article'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
