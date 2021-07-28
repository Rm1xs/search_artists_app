import 'package:flutter/material.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/artist_db_block.dart';

final ArtistDbBloc artBloc = ArtistDbBloc();

class ArtistDbPage extends StatelessWidget {
  ArtistDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History'),),
      body: SafeArea(
        child: Container(
          child: getArtist(),
        ),
      ),
    );
  }

  DbRepository db = DbRepository();

  Widget getArtist() {
    return FutureBuilder(
        future: db.getAllArtist(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Text('Not found information!');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      WidgetCard(snapshot.data[i].type.toString(),snapshot.data[i].name.toString())
                    ],
                  );
                },
              );
            }
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text('Error'); // error
          } else {
            return CircularProgressIndicator(); // loading
          }
        });
  }
}

class WidgetCard extends StatelessWidget {

  WidgetCard(this.type, this.name);


  final String name;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album, size: 45),
            title: Text(name),
            subtitle: Text(type),
          ),
        ],
      ),
    );
  }
}
dispose() {
  artBloc.dispose();
}
