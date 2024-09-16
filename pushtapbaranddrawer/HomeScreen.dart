import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? tabController; // Corrected from TapController to TabController
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Corrected typo from 'lentgh' to 'length' and initialized TabController
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 20.0,
        shadowColor: Colors.red,
        title: const Text(
          'TabBar and Drawer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        bottom: TabBar(
          controller: tabController, // Assign TabController here
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          labelStyle: const TextStyle(fontSize: 20),
          tabs: const [
            Tab(
              icon: Icon(Icons.laptop),
              text: "Laptop",
            ),
            Tab(
              icon: Icon(Icons.mobile_friendly),
              text: "Mobile",
            ),
            Tab(
              icon: Icon(Icons.computer),
              text: "Pc",
            ),
          ],
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "images/anaaa.jpg",
                        fit: BoxFit.cover,
                      ), // Correct fit
                    ),
                  ),
                  const Expanded(
                    child: ListTile(
                      title: Text("Mohamed Yasser"),
                      subtitle: Text("mohamed@gmail.com"),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text("Home Page"),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Account"),
                leading: const Icon(Icons.account_box),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Order"),
                leading: const Icon(Icons.check_box),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Contact Us"),
                leading: const Icon(Icons.mobile_friendly),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Sign Out"),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),

      body: TabBarView(
        controller: tabController, // Assign TabController here as well
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Laptop page"),
                ElevatedButton(
                  onPressed: () {
                    tabController!.animateTo(1); // Switch to the "Mobile" tab
                  },
                  child: const Text("Go to Mobile Tab"),
                ),
              ],
            ),
          ),
          const Center(child: Text("Mobile page"),),
          const Center(child: Text("Pc page")),
        ],
      ),
    );
  }
}
