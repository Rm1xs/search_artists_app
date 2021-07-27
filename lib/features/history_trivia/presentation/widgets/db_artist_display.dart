import 'package:flutter/material.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';

class DbArtistDisplay extends StatelessWidget {
  final Artist artist;

  const DbArtistDisplay({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: ListView.builder(
                  itemCount: artist.similar.results.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(artist.similar.results[index].name),
                      subtitle: Text(artist.similar.results[index].type),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
