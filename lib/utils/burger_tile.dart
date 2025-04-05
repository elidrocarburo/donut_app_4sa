import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  final String burgerFlavor;
  final String burgerPrice;
  final String burgerStore;
  //dynamic porque será de tipo color
  final dynamic burgerColor;
  final String imageName;
  final VoidCallback onAdd;

  const BurgerTile({super.key, required this.burgerFlavor, required this.burgerPrice, this.burgerColor, required this.imageName, required this.burgerStore, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        //color: donutColor[50],
        decoration: BoxDecoration(
          color: burgerColor[50],
          //esquinas redondeadas
          borderRadius: BorderRadius.circular(24)),
          child: Column(children: [
            Row(
              // alinea el precio a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Container(
                decoration: BoxDecoration(
                  color: burgerColor[100],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                padding: const EdgeInsetsDirectional.symmetric(vertical: 5,
                horizontal: 18),
                child: Text(
                  '\$$burgerPrice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: burgerColor[800]
                  ), //  \ caracter de escape para que no entienda que es una interpolación (backslash)
                ),
              ),

              // icons
            ],),
              // donut price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: Image.asset(imageName),
              ),
              
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Text(
                      burgerFlavor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),),
                    Text(
                      burgerStore,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),

              // donut text
            const Spacer(), // Empuja los íconos hacia abajo
            //*Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border, color: Colors.black),
                  IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                  
                ],
              ),
              )
          ],),
      ),
    );
  }
}