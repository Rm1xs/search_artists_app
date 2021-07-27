import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/widgets/widgets.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/bloc.dart';
import 'package:search_artists_app/injection_container.dart';

class ArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Artist Search'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
      ),
    );
  }
  //final ArtistDbBloc artistDbBloc = ArtistDbBloc();
  BlocProvider<DbArtistBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DbArtistBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              //ArtistControls(),
              // Top half
              BlocBuilder<DbArtistBloc, DbArtistState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: '',
                    );
                  } else if (state is Saving) {
                    return LoadingWidget();
                  } else if (state is Saved) {
                    //artistDbBloc.addArtist(state.artist as Artist);
                    return ArtistDisplay(artist: state.artist);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return MessageDisplay(message: 'Error');
                },
              ),
              //SizedBox(height: 20),
              // Bottom half
            ],
          ),
        ),
      ),
    );
  }
}