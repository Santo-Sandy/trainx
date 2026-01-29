import 'package:flutter/material.dart';

class home extends StatefulWidget {
  final name;
  const home(this.name, {super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome Home Page ${widget.name}",
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
