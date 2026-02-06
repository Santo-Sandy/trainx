import 'package:flutter/material.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  String word = "";
  TextEditingController controll = TextEditingController();

  void display(String name) {
    setState(() {
      word = name;
    });

    controll.clear();
  }

  @override
  void dispose() {
    controll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 131, 163, 179),
        leading: Icon(Icons.input, color: Colors.white),
        title: Text(
          "Input Welcome",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello, $word"),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(controller: controll, onSubmitted: display),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => display(controll.text),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
