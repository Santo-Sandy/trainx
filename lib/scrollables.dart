import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class srcolls extends StatefulWidget {
  const srcolls({super.key});

  @override
  State<srcolls> createState() => _srcollsState();
}

class _srcollsState extends State<srcolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 150, 187, 194),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "Scroll",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Scroll(),
    );
  }
}

class Scroll extends StatefulWidget {
  const Scroll({super.key});

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  int selectedIndex = -1;

  final List<String> list = ["a", "b", "d", "c", "f", "g", "h", "s"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              _button("ListView", 0),
              _button("GridView", 1),
              _button("PageView", 2),
              _button("CustomScrollView", 3),
            ],
          ),
        ),
        Expanded(child: _buildScrollable()),
      ],
    );
  }

  Widget _button(String text, int index) {
    return ElevatedButton(
      onPressed: () => setState(() => selectedIndex = index),
      child: Text(text),
    );
  }

  Widget _buildScrollable() {
    switch (selectedIndex) {
      case 0:
        return li(list);
      case 1:
        return gr(list);
      case 2:
        return page(list);
      case 3:
        return const csv();
      default:
        return const Center(child: Text("Select a view"));
    }
  }
}

class li extends StatelessWidget {
  final List<String> list;
  const li(this.list, {super.key});

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

class gr extends StatelessWidget {
  final List<String> list;
  const gr(this.list, {super.key});

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

class page extends StatelessWidget {
  final List<String> list;
  const page(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(child: Center(child: Text(list[index])));
      },
    );
  }
}

class csv extends StatelessWidget {
  const csv({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 180,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(title: Text('Store')),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('SilverGrid', style: TextStyle(fontSize: 20)),
          ),
        ),

        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (_, i) => Card(child: Center(child: Text('Grid $i'))),
            childCount: 6,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('SilverList', style: TextStyle(fontSize: 20)),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => ListTile(title: Text('List $i')),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
