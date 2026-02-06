import 'package:flutter/material.dart';

class navigated_screen extends StatelessWidget {
  final id;
  const navigated_screen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 177, 194),
        leading: Icon(Icons.route, color: Colors.white),
        title: Text(
          "Navigation with data",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: nav(id),
    );
  }
}

class nav extends StatelessWidget {
  final id;
  const nav(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text("Welcome the navigation through your text $id"),
      ),
    );
  }
}
