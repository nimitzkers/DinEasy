import 'package:flutter/material.dart';

import 'package:dineasy_management/StatusPage.dart';
import 'package:dineasy_management/MenuPage.dart';
import 'package:dineasy_management/BillPage.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var currentIndex = 0;

  StatusPage statusPage;
  MenuPage menuPage;
  BillPage billPage;
  List<Widget> pages;
  Widget currentPage;

  final name = AppBar(
    title: Text("Ultra Menya", style: TextStyle(fontSize: 25.0),),
    automaticallyImplyLeading: false,
    centerTitle: true,
  );

  var statusNav = BottomNavigationBarItem(
    icon: Icon(Icons.timeline),
    title: Text("Status"),
  );

  var menuNav = BottomNavigationBarItem(
    icon: Icon(Icons.restaurant_menu),
    title: Text("Menu"),
  );

  var billNav = BottomNavigationBarItem(
    icon: Icon(Icons.monetization_on),
    title: Text("Bill"),
  );

  @override
  void initState() {
    super.initState();

    statusPage = StatusPage();
    menuPage = MenuPage();
    billPage = BillPage();

    pages = [statusPage, menuPage, billPage,];

    currentPage = statusPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: name,
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[statusNav, menuNav, billNav],
      ),
    );
  }
}