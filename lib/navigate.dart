import 'package:flutter/material.dart';
import 'package:flutter_w1/account.dart';
import 'package:flutter_w1/cart.dart';
import 'package:flutter_w1/detail.dart';
import 'package:flutter_w1/explore.dart';
import 'package:flutter_w1/favourite.dart';
import 'package:flutter_w1/home.dart';

class NavigateBottom extends StatefulWidget {
  const NavigateBottom({super.key});

  @override
  State<NavigateBottom> createState() => _NavigateBottomState();
}

class _NavigateBottomState extends State<NavigateBottom> {
  static const List<Widget> _pageOption = [
    HomePage(),
    ExplorePage(),
    CartPage(),
    FavouritePage(),
    AccountPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xff53B175),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: _pageOption.elementAt(_selectedIndex),
    );
  }
}


