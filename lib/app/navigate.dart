import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/features/account/cubit/account_cubit.dart';
import 'package:flutter_w1/features/account/view/account_page.dart';
import 'package:flutter_w1/features/cart/cart.dart';
import 'package:flutter_w1/features/explore/cubit/explore_cubit.dart';
import 'package:flutter_w1/features/explore/explore.dart';
import 'package:flutter_w1/features/favourite/favourite.dart';
import 'package:flutter_w1/features/home/home.dart';

import '../features/home/cubit/home_cubit.dart';

class NavigateBottom extends StatefulWidget {
  const NavigateBottom({super.key});

  @override
  State<NavigateBottom> createState() => _NavigateBottomState();
}

class _NavigateBottomState extends State<NavigateBottom> {
  static List<Widget> get _pageOption => [
    BlocProvider<HomeCubit>(
      create: (_) => HomeCubit()..fetchProducts(),
      child: const HomePage(),
    ),
    BlocProvider(create: (_) => ExploreCubit()..fetchCategories(), child: const ExplorePage()),
    const CartPage(),
    const FavouritePage(),
    BlocProvider(create: (_) => AccountCubit()..fetchAccount(), child: const AccountPage()),
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
