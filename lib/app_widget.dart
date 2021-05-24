import 'package:chapter_1_challenge_2/pages/create_note/create_note_page.dart';
import 'package:chapter_1_challenge_2/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
