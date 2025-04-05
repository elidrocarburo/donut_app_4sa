import 'package:donut_app_4sa/tabs/burger_tab.dart';
import 'package:donut_app_4sa/tabs/donut_tab.dart';
import 'package:donut_app_4sa/tabs/pancakes_tab.dart';
import 'package:donut_app_4sa/tabs/pizza_tab.dart';
import 'package:donut_app_4sa/tabs/smoothie_tab.dart';
import 'package:donut_app_4sa/utils/my_tab.dart';
import 'package:donut_app_4sa/utils/shopping_cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemCount = 0;
  double totalPrice = 0.0;

  void updateCart(int count, double price) {
    setState(() {
      itemCount += 1;
      totalPrice += price;
    });
  }

  List<Widget> myTabs = [
    Column(
      children: [
        const MyTab(iconPath: 'lib/icons/donut.png',),
        const Text('Donut', style: TextStyle(fontSize: 12.0),)
      ],
    ),
    Column(
      children: [
        const MyTab(iconPath: 'lib/icons/burger.png',),
        const Text('Burger', style: TextStyle(fontSize: 12.0),)
      ],
    ),
    Column(
      children: [
        const MyTab(iconPath: 'lib/icons/smoothie.png',),
        const Text('Smoothie', style: TextStyle(fontSize: 12.0),)
      ],
    ),
    Column(
      children: [
        const MyTab(iconPath: 'lib/icons/pancakes.png',),
        const Text('Pancakes', style: TextStyle(fontSize: 12.0),)
      ],
    ),
    Column(
      children: [
        const MyTab(iconPath: 'lib/icons/pizza.png',),
        const Text('Pizza', style: TextStyle(fontSize: 12.0),)
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu, 
            color: Colors.grey[800]
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const Text('I want to ', style: TextStyle(fontSize: 32)),
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(updateCart: updateCart),
                  BurgerTab(updateCart: updateCart),
                  SmoothieTab(updateCart: updateCart),
                  PanCakesTab(updateCart: updateCart),
                  PizzaTab(updateCart: updateCart),
                ],
              ),
            ),
            ShoppingCart(itemCount: itemCount, totalPrice: totalPrice),
          ],
        ),
      ),
    );
  }
}
