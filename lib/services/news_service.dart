import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsService {
  static const String _apiKey = '09089cd869de4fa4b9b5d79141c31f1b';
  static const String _baseUrl = 'https://newsapi.org/v2';

  // Fetch Top Headlines by category
  Future<List<Article>> fetchTopHeadlines(String category) async {
    final url = Uri.parse(
        '$_baseUrl/top-headlines?country=us&category=$category&apiKey=$_apiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List<dynamic> articlesJson = body['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
