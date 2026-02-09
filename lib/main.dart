import 'package:StoreLink/bloc/counter_bloc.dart';
import 'package:StoreLink/counter.dart';
import 'package:StoreLink/router.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(index());
}

class index extends StatelessWidget {
  const index({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAppState()),
        ChangeNotifierProvider(create: (_) => counternum()),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => CounterBloc())],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 3, 109, 128),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  FocusNode _focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 150, 187, 194),
        leading: Icon(Icons.flutter_dash, color: Colors.white),
        title: Text(
          "Flutter Practice",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.push("/welcome");
                  },
                  child: Text("Welcome"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/counter/hi");
                  },
                  child: Text("Counter"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/counterscreen");
                  },
                  child: Text("Bloc Counter"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/layout");
                  },
                  child: Text("Layouts"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/stack");
                  },
                  child: Text("Stack"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/scrolls");
                  },
                  child: Text("Scroll"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/navigation");
                  },
                  child: Text("Navigation"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.push("/httpdio");
                  },
                  child: Text("Http/Dio"),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push("/forms");
                  },
                  child: Text("Form"),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
