import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch default category news
    context.read<NewsBloc>().add(FetchNews(categories[_selectedCategoryIndex]));
  }

  void _onCategoryChanged(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    context.read<NewsBloc>().add(FetchNews(categories[_selectedCategoryIndex]));
  }

  @override
  Widget build(BuildContext context) {
    final currentCategory = categories[_selectedCategoryIndex];
    final capitalizedCategory =
        '${currentCategory[0].toUpperCase()}${currentCategory.substring(1)}';

    return Scaffold(
      appBar: AppBar(
        title: Text('$capitalizedCategory News'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Horizontal Category Selector
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == _selectedCategoryIndex;
                return GestureDetector(
                  onTap: () => _onCategoryChanged(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.purple : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category.toUpperCase(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  final articles = state.articles;
                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return NewsItemCard(article: articles[index]);
                    },
                  );
                } else if (state is NewsError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center(child: Text('Select a category to see news.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

