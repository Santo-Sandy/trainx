import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class http_dio extends StatelessWidget {
  const http_dio({super.key});

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
      body: DioWidget(),
    );
  }
}

class DioWidget extends StatelessWidget {
  DioWidget({super.key});

  final TextEditingController id = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController updateid = TextEditingController();
  final TextEditingController updatename = TextEditingController();

  Future<user> getData(String path) async {
    final dio = Dio();
    final response = await dio.get(path);
    print(user.fromJson(response.data));
    return user.fromJson(response.data);
  }

  Future<void> createUser(user us, String path) async {
    final dio = Dio();
    await dio.post(
      path,
      data: {'id': us.id, 'name': us.name, 'email': us.email},
    );
  }

  Future<void> updateuser(String name, String path) async {
    final dio = Dio();
    await dio.put(path, data: {'name': name});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            "Users data",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            for (int i = 1; i <= 5; i++)
              FutureBuilder<user>(
                future: getData(
                  "https://jsonplaceholder.typicode.com/users/$i",
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  if (!snapshot.hasData) {
                    return const Text("No data found");
                  }
                  final user = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        "ID: ${user.id}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text("Name: ${user.name}"),
                      Text("Email: ${user.email}"),
                    ],
                  );
                },
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                controller: id,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hint: Text("Id"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers_rounded),
                ),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hint: Text("Name"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hint: Text("Email"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              int ids = int.parse(id.text);
              createUser(
                user(ids, email.text, name.text),
                "https://jsonplaceholder.typicode.com/users/",
              );
              id.clear();
              name.clear();
              email.clear();
              print("Posted");
            },
            child: Text("Post"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              TextField(
                controller: updateid,
                decoration: InputDecoration(
                  hint: Text("id"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers_rounded),
                ),
              ),
              TextField(
                controller: updatename,
                decoration: InputDecoration(
                  hint: Text("Update Name"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              int ids = int.parse(updateid.text);
              updateuser(
                updatename.text,
                "https://jsonplaceholder.typicode.com/users/$ids",
              );
              updateid.clear();
              updatename.clear();
              print("updated");
            },
            child: Text("Put"),
          ),
        ),
      ],
    );
  }
}

class user {
  final int id;
  final String email;
  final String name;

  const user(this.id, this.email, this.name);

  factory user.fromJson(Map<String, dynamic> json) {
    return user(json['id'], json['email'], json['name']);
  }
}
