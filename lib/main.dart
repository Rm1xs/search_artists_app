import 'package:flutter/material.dart';
import 'package:search_artists_app/core/theme/app_theme.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/pages/artist_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artist Search',
      theme: CustomTheme.lightTheme,
      home: ArtistPage(),
    );
  }
}
