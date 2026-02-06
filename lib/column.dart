import 'package:flutter/material.dart';

class columnpage extends StatefulWidget {
  const columnpage({super.key});

  @override
  State<columnpage> createState() => _columnState();
}

class _columnState extends State<columnpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 150, 187, 194),
        leading: Icon(Icons.layers_outlined, color: Colors.white),
        title: Text(
          "Layout",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: layout(),
    );
  }
}

class layout extends StatefulWidget {
  layout({super.key});

  @override
  State<layout> createState() => _layoutState();
}

class _layoutState extends State<layout> {
  bool showgrid = false;
  bool showlist = false;
  bool showcolumn = false;
  bool showrow = false;
  List<String> layouts = ["A", "B", "C", "D", "E"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showgrid = true;
                  showlist = false;
                  showcolumn = false;
                  showrow = false;
                });
              },
              child: Text(
                "Grid",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showlist = true;
                  showgrid = false;
                  showcolumn = false;
                  showrow = false;
                });
              },
              child: Text(
                "List",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showcolumn = true;
                  showgrid = false;
                  showlist = false;
                  showrow = false;
                });
              },
              child: Text(
                "Column",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showgrid = false;
                  showlist = false;
                  showcolumn = false;
                  showrow = true;
                });
              },
              child: Text(
                "Row",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        if (showgrid) Expanded(child: GridPage(layouts)),
        if (showlist) Expanded(child: listpage(layouts)),
        if (showcolumn) Expanded(child: colpage(layouts)),
        if (showrow) Expanded(child: rowpage(layouts)),
      ],
    );
  }
}

class GridPage extends StatelessWidget {
  List<String> list;
  GridPage(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,

        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Card(child: Center(child: Text(list[index])));
      },
    );
  }
}

class listpage extends StatelessWidget {
  List<String> list;
  listpage(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100,
            height: 100,
            child: Card(child: Center(child: Text(list[index]))),
          );
        },
      ),
    );
  }
}

class colpage extends StatelessWidget {
  List<String> list;
  colpage(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(child: Center(child: Text(list[index])));
            },
          ),
        ),
      ],
    );
  }
}

class rowpage extends StatelessWidget {
  List<String> list;
  rowpage(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Card(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(list[index]));
              },
            ),
          ),
        ),
        Flexible(
          child: Card(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(list[index]));
              },
            ),
          ),
        ),
        Flexible(
          child: Card(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(list[index]));
              },
            ),
          ),
        ),
        Flexible(
          child: Card(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(list[index]));
              },
            ),
          ),
        ),
        Flexible(
          child: Card(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(list[index]));
              },
            ),
          ),
        ),
      ],
    );
  }
}
