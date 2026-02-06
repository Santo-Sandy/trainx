import "package:flutter/material.dart";

class stacks extends StatelessWidget {
  const stacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 150, 187, 194),
        leading: Icon(Icons.layers_outlined, color: Colors.white),
        title: Text(
          "Stacking",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: stacking(),
    );
  }
}

class stacking extends StatelessWidget {
  const stacking({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 188, 206),
                  borderRadius: BorderRadiusGeometry.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo/zoro.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Error In sector",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 188, 206),
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Error In sector",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 188, 206),
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Error In sector",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 188, 206),
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Error In sector",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 188, 206),
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Error In sector",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 188, 206),
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Error In sector",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
