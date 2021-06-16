import 'package:flutter/material.dart';
import 'package:grad_project/Screens/DetailsScreen.dart';
import 'package:grad_project/Screens/ProductsScreen.dart';

import 'CategoryScreen.dart';
import 'LogIn.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;
  List _list = [CategoryScreen(), ProductScreen()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _list[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Category",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: "Products",
                backgroundColor: Colors.grey),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.shopping_cart),
            //     label: "Cart",
            //     backgroundColor: Colors.grey),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.menu),
            //     label: "Menu",
            //     backgroundColor: Colors.grey),
          ],
        ),
      ),
    );
  }
}
