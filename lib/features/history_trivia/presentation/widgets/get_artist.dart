import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_bloc.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_state.dart';
import 'package:search_artists_app/features/history_trivia/presentation/widgets/widget_card.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DbArtistBloc, DbArtistState>(
      builder: (context, state) {
        if (state is Empty) {
          return Center(child: Text('No data'));
        }
        if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is Loaded) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (context, index) => Container(
              child: Column(
                children: [
                  WidgetCard(state.list[index].type.toString(),
                      state.list[index].name.toString())
                ],
              ),
            ),
          );
        }

        if (state is Error) {
          return Center(
            child: Text('Error', style: TextStyle(fontSize: 20.0)),
          );
        }
        return Container();
      },
    );
  }
}
