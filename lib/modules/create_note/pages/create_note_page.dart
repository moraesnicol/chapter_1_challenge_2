import 'dart:ui';

import 'package:chapter_1_challenge_2/core/app_theme.dart';
import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  //editstate
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Editar" : " Criar Nota"),
        backgroundColor: AppTheme.colors.createNoteAppbar,

        //  backgroundColor: Gradient.linear(i, to, colors)
        centerTitle: true,
        actions: [
          if (isEdit)
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(context, "");
                }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              cursorColor: Colors.deepOrange,
              cursorRadius: Radius.circular(200.0),
              cursorWidth: 4.0,
              maxLength: 280,
              controller: textController,
              maxLines: 6,
              autofocus: true,
              textInputAction: TextInputAction.send,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.note_add_sharp),
                  hintText: "Nota",
                  helperText: "Digite a nota"),
            ),
            SizedBox(height: 100),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, description);
                      },
                      child: Text("Salvar"),
                      style: ElevatedButton.styleFrom(
                        primary: AppTheme.colors.saveButton,
                      ),
                    ),
                  ),
                ],
              )
          ]),
        ),
      ),
    );
  }
}
