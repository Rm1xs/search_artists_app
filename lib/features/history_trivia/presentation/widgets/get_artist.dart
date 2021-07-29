import 'package:flutter/material.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';
import 'package:search_artists_app/features/history_trivia/presentation/widgets/widget_card.dart';

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
                  WidgetCard(snapshot.data[i].type.toString(),
                      snapshot.data[i].name.toString())
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
    },
  );
}
