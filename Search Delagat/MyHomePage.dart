import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Define the list as List<Map<String, dynamic>> to ensure type safety

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Search Delegate",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: CutsomSearch());
          }, icon: Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}

class CutsomSearch extends SearchDelegate {
  List username = [
    "Mohamed",
    "Khaled",
    "Ahmed",
    "Yasser",
    "Anas",
    "Youssef",
    "Mazen",
    "Essam",
    "Seif",
    "Samir",
    "Wael",
  ];

  List? filterlist;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {


    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(query == "")
      {
        return ListView.builder(
            itemCount: username.length,
            itemBuilder: (context , i) {
              return InkWell(
                onTap: () {
                  showResults(context);
                },
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("${username[i]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
                )),
              );
            });

      }
    else {
      filterlist = username.where((element) => element.contains(query)).toList();
      return ListView.builder(
          itemCount: filterlist!.length,
          itemBuilder: (context , i) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("${filterlist![i]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
              )),
            );
          });

    }

  }

}
