import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 120.0;

  String title;
  Color gradientBegin, gradientEnd;

  GradientAppBar({
    Key? key,
    required this.title,
    required this.gradientBegin,
    required this.gradientEnd,
    required bool centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[gradientBegin, gradientEnd],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black87,
            letterSpacing: 5.0,
            fontSize: 25.0,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
