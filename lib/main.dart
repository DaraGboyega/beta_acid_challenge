import 'package:beta_acid_challenge/screens/album_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Beta Acid Challenge",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const AlbumListScreen(),
    );
  }
}
