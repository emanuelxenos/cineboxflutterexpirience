import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/favorites/favorites_scrreen.dart';
import 'package:cinebox/ui/home/home_screen.dart';
import 'package:cinebox/ui/login/login_screen.dart';
import 'package:cinebox/ui/movie_detail/commands/movie_detail_screen.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CINEBOX',
      theme: AppTheme.theme,
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => SplashScreen(),
        '/login': (_) => LoginScreen(),
        '/home': (_) => HomeScreen(),
        '/favoritos': (_) => FavoritesScrreen(),
        '/movie_details': (_) => MovieDetailScreen(),
      },
    );
  }
}
