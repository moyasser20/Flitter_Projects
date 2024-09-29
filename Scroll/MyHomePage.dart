import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print("${scrollController.offset}");
    });
  }

  @override
  void dispose() {
    scrollController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Scroll",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        controller: scrollController,
        children: [
          MaterialButton(onPressed: () {
            scrollController.animateTo(9497, duration: Duration(seconds: 1), curve: Curves.ease);
          } , child: Text("Jumped to buttom"),),
          ...List.generate(100, (index) => Container(
            alignment: Alignment.center,
            height: 100,
            child: Text("$index", style: TextStyle(fontSize: 25),),
            color: index.isEven ? Colors.red : Colors.green,
          )),
          MaterialButton(onPressed: () {
            scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
          } , child: Text("Jumped to top"),),

        ],
      ),
    );
  }
}