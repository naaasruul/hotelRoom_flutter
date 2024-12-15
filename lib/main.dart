import 'package:flutter/material.dart';
import 'home.dart';
import 'roompanel.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Home(),
      routes: {
        'homeLink' : (context) => Home(),
        'roomsPanel' : (context) =>RoomPanel(),
      },
    );
  }
}
