import 'package:flutter/material.dart';
import 'package:flutter_sql_lite_crud/crud/view/note_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Crud',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      home: const NoteHome(),
    );
  }
}