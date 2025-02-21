import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;
  NewsBloc({required this.newsService}) : super(NewsInitial()) {
    on<FetchNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final articles = await newsService.fetchTopHeadlines(event.category);
        emit(NewsLoaded(articles: articles));
      } catch (e) {
        emit(NewsError(message: e.toString()));
      }
    });
  }
}

