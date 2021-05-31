import 'package:flutter/material.dart';

abstract class AppColorsBase {
  Color get createNoteAppbar;
  Color get saveButton;
}

class AppColorsDefault implements AppColorsBase {
  @override
  Color get createNoteAppbar => Color(0xFFE5E817);

  @override
  Color get saveButton => Color(0xFF94F109);
}
