part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {
  final String category;
  const FetchNews(this.category);

  @override
  List<Object> get props => [category];
}
