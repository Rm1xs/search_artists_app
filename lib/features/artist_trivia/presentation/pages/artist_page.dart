import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/bloc/bloc.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/widgets/widgets.dart';
import 'package:search_artists_app/features/history_trivia/presentation/pages/db_artist_page.dart';
import 'package:search_artists_app/injection_container.dart';

class ArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist Search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  //final ArtistDbBloc artistDbBloc = ArtistDbBloc();
  BlocProvider<ArtistBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ArtistBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              ArtistControls(),
              BlocBuilder<ArtistBloc, ArtistState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Enter author name',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded &&
                      state.artist.similar.info.length != 2) {
                    return ArtistDisplay(artist: state.artist);
                  } else if (state is Error) {
                    return MessageDisplay(message: 'Error');
                  }
                  return MessageDisplay(message: 'No found similar');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
