import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Localstore extends StatelessWidget {
  const Localstore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 177, 194),
        leading: Icon(Icons.storage, color: Colors.white),
        title: Text(
          "Storage",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: store(),
    );
  }
}

class store extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  store({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Text("The Stored value before: ${controller.text}"),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.edit_note_rounded),
              hint: Text("Enter to store local storage!"),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final userBox = Hive.box<namestore>('users');
                final user = namestore('Santo');
                await userBox.put(user.user, user);
                final users = userBox.values.toList();
                for (var user in users) {
                  print(user.user);
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("Store"),
          ),
        ],
      ),
    );
  }
}

@HiveType(typeId: 1)
class namestore {
  @HiveField(0)
  String user;
  namestore(this.user);
}
