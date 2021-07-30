import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_bloc.dart';
import 'package:search_artists_app/features/history_trivia/presentation/widgets/get_artist.dart';

import '../../../../injection_container.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DbArtistBloc>(
      create: (_) => hstr<DbArtistBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text('Last query')),
        body: Container(
          child: History(),
        ),
      ),
    );
  }
}
