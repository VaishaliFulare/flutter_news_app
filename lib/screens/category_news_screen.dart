import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_item_card.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String category; // Passed from the CategoryCard
  const CategoryNewsScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger fetching news for this category when the screen loads.
    context.read<NewsBloc>().add(FetchNews(widget.category));
  }

  @override
  Widget build(BuildContext context) {
    // Capitalize the first letter for display.
    final displayCategory = '${widget.category[0].toUpperCase()}${widget.category.substring(1)}';

    return Scaffold(
      appBar: AppBar(
        title: Text('$displayCategory News'),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
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
          return const Center(child: Text('No news available.'));
        },
      ),
    );
  }
}
