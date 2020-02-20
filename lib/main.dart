import 'Lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Clients',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(title: Text('Our Clients'), actions: <Widget>[IconButton(icon: Icon(Icons.filter_list), onPressed: () {},)],),
      body: Lista(),
      )
    );
  }
}

