import 'package:donut_app_4sa/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function(int, double) updateCart; // Se agrega el parámetro para actualizar el carrito

  PizzaTab({super.key, required this.updateCart});

  final List pizzasOnSale = [
    ["Classic", "Pizza Amore", "15", Colors.red, "lib/images/classic_pizza.png"],
    ["Two Ingredients", "Infinite Crust", "18", Colors.orange, "lib/images/mushroompepperoni_pizza.png"],
    ["Meat", "Il Forno Italiano", "20", Colors.brown, "lib/images/meat_pizza.png"],
    ["Vegan", "Pasta & Pizza Italia", "25", Colors.green, "lib/images/vegan_pizza.png"],
    ["Hawaiian", "La Dolce Pizza", "18", Colors.yellow, "lib/images/hawaiian_pizza.png"],
    ["Pesto", "Mamma Mia's Pizzeria", "24", Colors.lightGreen, "lib/images/pesto_pizza.png"],
    ["Veggies", "Pizza della Casa", "19", Colors.green, "lib/images/vegetables_pizza.png"],
    ["Cheese", "Pizzeria Roma", "10", Colors.amber, "lib/images/cheese_pizza.png"]
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
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaFlavor: pizzasOnSale[index][0],
          pizzaStore: pizzasOnSale[index][1],
          pizzaPrice: pizzasOnSale[index][2],
          pizzaColor: pizzasOnSale[index][3],
          imageName: pizzasOnSale[index][4],
          onAdd: () => addToCart(pizzasOnSale[index][2]), // Se pasa la función correcta
        );
      },
    );
  }
}
