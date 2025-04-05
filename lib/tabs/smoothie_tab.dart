import 'package:donut_app_4sa/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final Function(int, double) updateCart; // Se agrega el parámetro para actualizar el carrito

  SmoothieTab({super.key, required this.updateCart});

  final List smoothiesOnSale = [
    ["Raspberry", "Smoothie Oasis", "10", Colors.red, "lib/images/raspberry_smoothie.png"],
    ["Strawberry", "Blendtopia", "8", Colors.pink, "lib/images/strawberry_smoothie.png"],
    ["Grape", "Fruit Fusion", "11", Colors.purple, "lib/images/grape_smoothie.png"],
    ["Grapefruit", "Tropical Twist", "13", Colors.deepOrange, "lib/images/grapefruit_smoothie.png"],
    ["Mango", "Happy Sips", "6", Colors.amber, "lib/images/mango_smoothie.png"],
    ["Orange", "Fresh n' Fruity", "5", Colors.orange, "lib/images/orange_smoothie.png"],
    ["Greens", "Smoothie Magic", "9", Colors.green, "lib/images/green_smoothie.png"],
    ["Tuttifrutti", "Smoothie Central", "15", Colors.teal, "lib/images/tuttifrutti_smoothie.png"]
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
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieFlavor: smoothiesOnSale[index][0],
          smoothieStore: smoothiesOnSale[index][1],
          smoothiePrice: smoothiesOnSale[index][2],
          smoothieColor: smoothiesOnSale[index][3],
          imageName: smoothiesOnSale[index][4],
          onAdd: () => addToCart(smoothiesOnSale[index][2]), // Se pasa la función correcta
        );
      },
    );
  }
}
