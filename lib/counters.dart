import 'package:StoreLink/counter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
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
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<counternum>();
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: ${counter.counts}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: context.read<counternum>().increments,
                  child: Text("Increments"),
                ),
                ElevatedButton(
                  onPressed: context.read<counternum>().decrements,
                  child: Text("Decrements"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
