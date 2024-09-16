import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  int selectedindex = 0;
  TabController? tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<Widget> listwidget = [
    Text("Page 1" , style: TextStyle(fontSize: 30),),
    Text("Page 2" , style: TextStyle(fontSize: 30),),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  // Corrected method name
  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        currentIndex: selectedindex,
        backgroundColor: Colors.red,
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("BottomNavigationBar", style: TextStyle(
            fontSize: 20
        ),),
        centerTitle: true,

        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: TextStyle(fontSize: 10),
          labelStyle: TextStyle(fontSize: 20),
          tabs: [
            Tab(
              icon: Icon(Icons.laptop),
              text: "LapTop",
            ),
            Tab(
              icon: Icon(Icons.mobile_friendly),
              text: "Mobile",
            ),
            Tab(
              icon: Icon(Icons.account_box),
              text: "Account",
            ),
          ],
        ),
      ),
      drawer: (
      Drawer(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child:Image.asset("images/anaaa.jpg", fit: BoxFit.cover,)
                    ),
                  ),
                  const Expanded(child: ListTile(
                    title: Text("Mohamed Yasser"),
                    subtitle: Text("mohamedyasser@gmail.com"),
                  ),),
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
                title: const Text("order"),
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
                title: const Text("Sign out"),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text("Return"),
                leading: const Icon(Icons.backspace_outlined),
                onTap: () {
                  Navigator.pop(context);
                },
              ),


            ],
          ),
        ),
      )
      ),
      body: IndexedStack(
        index: selectedindex,
        children: [
          Column(
            children: [
              Expanded(child: TabBarView(
                controller: tabController,
                children: [
                  const Center(child: Text("Laptop Content", style: TextStyle(fontSize: 25),),),
                  const Center(child: Text("Mobile Content", style: TextStyle(fontSize: 25),),),
                  const Center(child: Text("Acount Content", style: TextStyle(fontSize: 25),),),
                ],
              ),),
              Expanded(child: PageView(
                onPageChanged: (val)
                {
                  print(val);
                },
                children: [
                  Center(
                    child: Image.asset("images/ana.jpg"),
                  ),
                  Center(
                    child: Text("Page 2 in pageView" ,  style: TextStyle(fontSize: 25),),
                  ),
                  Center(
                    child: Text("Page 3 in pageView" ,  style: TextStyle(fontSize: 25),),
                  ),
                ],
              ))
            ],
          ),
          Center(child: listwidget[selectedindex],)
        ],
      )
    );
  }
}
