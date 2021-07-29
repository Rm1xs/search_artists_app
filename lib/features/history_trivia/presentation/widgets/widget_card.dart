import 'package:flutter/material.dart';

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
