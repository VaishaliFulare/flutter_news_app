import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // Import provider
import 'bloc/news_bloc.dart';
import 'services/news_service.dart';
import 'screens/main_screen.dart';
import 'theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return BlocProvider(
          create: (context) => NewsBloc(newsService: NewsService()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter News App',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              brightness: Brightness.light,
              textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.purple,
              brightness: Brightness.dark,
              textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
            ),
            themeMode: themeNotifier.currentTheme,
            home: const MainScreen(),
          ),
        );
      },
    );
  }
}


