import 'package:flutter/material.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/artist_db_block.dart';
import 'package:search_artists_app/features/history_trivia/presentation/widgets/get_artist.dart';

final ArtistDbBloc artBloc = ArtistDbBloc();

class ArtistDbPage extends StatelessWidget {
  ArtistDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Last query')),
      body: SafeArea(
        child: Container(
          child: getArtist(),
        ),
      ),
    );
  }
}

dispose() {
  artBloc.dispose();
}
