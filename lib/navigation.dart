import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 142, 177, 194),
          leading: Icon(Icons.route, color: Colors.white),
          title: Text(
            "Navigation with data",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: navigationbody(),
      ),
    );
  }
}

class navigationbody extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  navigationbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                prefixIcon: Icon(Icons.route_outlined),
                border: InputBorder.none,
                hint: Text("Enter id to navigate and display!"),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.go("/navigated_screen/${controller.text}");
          },
          child: Text("click to navigate with id"),
        ),
      ],
    );
  }
}
