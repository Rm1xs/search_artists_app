import 'package:flutter/material.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/pages/artist_page.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artist Search',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.lightBlueAccent,
      ),
      home: ArtistPage(),
    );
  }
}
