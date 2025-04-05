import 'package:donut_app_4sa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(int, double) updateCart; // Se agrega el parámetro para actualizar el carrito

  DonutTab({super.key, required this.updateCart});

  final List donutsOnSale = [
    ["Ice Cream", "Yum Yums", "8", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "Mur Mura", "5", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "nascita", "10", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Dough Delights", "7", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Vanilla", "Milk Dipper", "5", Colors.yellow, "lib/images/vanilla_donut.png"],
    ["Matcha", "Donut Dreamland", "12", Colors.green, "lib/images/matcha_donut.png"],
    ["Choco Strawberry", "Donut Factory", "11", Colors.pink, "lib/images/chocostrawberry_donut.png"],
    ["Chocomint", "Sweet Rings", "13", Colors.cyan, "lib/images/chocomint_donut.png"]
  ];

  int itemCount = 0;
  double totalPrice = 0.0;

  void addToCart(String price) {
    itemCount++;
    totalPrice += double.parse(price);
    updateCart(itemCount, totalPrice); // Llamamos la función para actualizar el carrito
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutStore: donutsOnSale[index][1],
          donutPrice: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
          onAdd: () => addToCart(donutsOnSale[index][2]), // Se pasa la función correcta
        );
      },
    );
  }
}
