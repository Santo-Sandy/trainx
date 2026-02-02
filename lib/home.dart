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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 142, 177, 194),
          leading: Icon(Icons.add_to_photos_rounded, color: Colors.white),
          title: Text(
            "Counter",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: counter(),
      ),
    );
  }
}

class counter extends StatefulWidget {
  const counter({super.key});

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  int count = 0;
  void counter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: $count"),
            ElevatedButton(onPressed: counter, child: Text("Counter")),
          ],
        ),
      ),
    );
  }
}
