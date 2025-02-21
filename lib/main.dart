import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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

  /// Light Theme
  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      // AppBar
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Bottom Nav
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
      cardColor: Colors.white,
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
    );
  }

  /// Dark Theme
  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: const Color(0xFF121212),
      // AppBar
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1F1F1F),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Bottom Nav
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1F1F1F),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
      ),
      cardColor: const Color(0xFF1F1F1F),
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return BlocProvider(
      create: (context) => NewsBloc(newsService: NewsService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter News App',
        theme: lightTheme,
        darkTheme: darkTheme,
        // Decide which theme to use based on the boolean in ThemeNotifier
        themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const MainScreen(),
      ),
    );
  }
}



