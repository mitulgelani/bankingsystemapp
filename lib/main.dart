import 'package:bankingapp/pages/Customers.dart';
import 'package:bankingapp/pages/Transactions.dart';
import 'package:bankingapp/pages/History.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BankingApp",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    Customers(),
    History()
  ];
   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
   void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }
   void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text(
          "Banking System",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
      currentIndex: _pageIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Customers")),
        BottomNavigationBarItem(icon: Icon(Icons.notes_rounded), title: Text("History")),
      ],
    
    ),
      body: 
      PageView(
        children: tabPages,
       onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );

      
  }
}
