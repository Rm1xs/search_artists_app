import 'package:flutter/material.dart';
import 'package:search_artists_app/features/artist_databse/bloc/artist_db_block.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

final ArtistDbBloc artBloc = ArtistDbBloc();

class ArtistDbPage extends StatelessWidget {
  ArtistDbPage({Key? key}) : super(key: key);

  Widget getArtistWidget() {
    return StreamBuilder(
      stream: artBloc.artists,
      builder: (BuildContext context, AsyncSnapshot<List<Info>> snapshot) {
        return getArtistCardWidget(snapshot);
      },
    );
  }

  Widget getArtistCardWidget(AsyncSnapshot<List<Info>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Text(snapshot.data![i].type.toString()),
            Text(snapshot.data![i].name.toString()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: getArtistWidget(),
        ),
      ),
    );
  }
}
