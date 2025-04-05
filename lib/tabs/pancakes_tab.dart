import 'package:donut_app_4sa/utils/pancakes_tile.dart';
import 'package:flutter/material.dart';

class PanCakesTab extends StatelessWidget {
  final Function(int, double) updateCart; // Se agrega el parámetro para actualizar el carrito

  PanCakesTab({super.key, required this.updateCart});

  final List pancakesOnSale = [
    ["Classic", "The Pancake Hub", "10", Colors.yellow, "lib/images/classic_pancakes.png"],
    ["Whipped Cream", "Fluffy Dreams", "12", Colors.lightBlue, "lib/images/cream_pancakes.png"],
    ["Oatmeal", "Pancake Pioneers", "16", Colors.purple, "lib/images/oatmeal_pancakes.png"],
    ["Mama's Dinner", "Mama's Pancakes", "18", Colors.pink, "lib/images/mamas_pancakes.png"],
    ["Berries", "Sweet Stack Studio", "15", Colors.teal, "lib/images/fruit_pancakes.png"],
    ["Ice Cream", "Pancake Wonderland", "14", Colors.indigo, "lib/images/icecream_pancakes.png"],
    ["Chocolate Dream", "Creative Pancake Co.", "20", Colors.brown, "lib/images/chocolatetoppings_pancakes.png"],
    ["The Lovers", "Dreamy Layers", "15", Colors.red, "lib/images/couple_pancakes.png"]
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
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return PancakesTile(
          pancakesFlavor: pancakesOnSale[index][0],
          pancakesStore: pancakesOnSale[index][1],
          pancakesPrice: pancakesOnSale[index][2],
          pancakesColor: pancakesOnSale[index][3],
          imageName: pancakesOnSale[index][4],
          onAdd: () => addToCart(pancakesOnSale[index][2]), // Se pasa la función correcta
        );
      },
    );
  }
}
