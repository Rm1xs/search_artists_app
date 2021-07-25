import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/bloc/bloc.dart';

class ArtistControls extends StatefulWidget {
  const ArtistControls({
    Key? key,
  }) : super(key: key);

  @override
  _ArtistControlsState createState() => _ArtistControlsState();
}

class _ArtistControlsState extends State<ArtistControls> {
  final controller = TextEditingController();
  String? inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              //hintText: 'Artist',
              labelText: 'Artist'),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
            SizedBox(width: 10),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<ArtistBloc>(context).add(GetArtistName(inputStr!));
  }
}
