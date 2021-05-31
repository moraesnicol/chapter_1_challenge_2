import 'package:chapter_1_challenge_2/modules/home_page/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro Item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Small Notes",
        gradientBegin: Color(0xFFE5E817),
        gradientEnd: Color(0xFFFFE96F),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            for (var i = 0; i < notes.length; i++)
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                height: 200,
                width: double.maxFinite,
                child: Card(
                  color: Color(0xFFE5E817),
                  elevation: 10,
                  child: ListTile(
                    title: Text(notes[i]),
                    onTap: () async {
                      var response = await Navigator.pushNamed(
                          context, "/create-note",
                          arguments: notes[i]);
                      if (response != null) {
                        var description = response as String;
                        if (response.isEmpty) {
                          notes.removeAt(i);
                        } else {
                          notes[i] = description;
                        }
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF94F109),
        child: Icon(Icons.add),
        onPressed: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        },
      ),
    );
  }
}
