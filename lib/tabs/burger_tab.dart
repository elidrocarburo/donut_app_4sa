import 'package:donut_app_4sa/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(int, double) updateCart; // Se agrega el parámetro para actualizar el carrito

  BurgerTab({super.key, required this.updateCart});

  final List burgerOnSale = [
    ["Classic", "Grill Masters", "6", Colors.red, "lib/images/classic.png"],
    ["Vegan", "The Burger Lab", "9", Colors.lightGreen, "lib/images/vegan_burger.png"],
    ["Cheeseburger", "PattyCrafters", "4", Colors.yellow, "lib/images/cheeseburger.png"],
    ["Double Beef", "Juicy Jamboree", "12", Colors.brown, "lib/images/doublebeef_burger.png"],
    ["Bacon", "BiteMe Buns", "7", Colors.lightBlue, "lib/images/bacon_burger.png"],
    ["Kids Burger", "BurgerAlchemy", "2", Colors.amber, "lib/images/mini_burger.png"],
    ["Burger + Drink Pack", "Whisker's Burgers", "9", Colors.purple, "lib/images/burger_drink.png"],
    ["Yummy Pack", "The Burger Barnyard", "15", Colors.orange, "lib/images/complete_pack.png"]

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
      itemCount: burgerOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgerOnSale[index][0],
          burgerStore: burgerOnSale[index][1],
          burgerPrice: burgerOnSale[index][2],
          burgerColor: burgerOnSale[index][3],
          imageName: burgerOnSale[index][4],
          onAdd: () => addToCart(burgerOnSale[index][2]), // Se pasa la función correcta
        );
      },
    );
  }
}
