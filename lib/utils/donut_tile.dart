import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final String donutStore;
  //dynamic porque será de tipo color
  final dynamic donutColor;
  final String imageName;

  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, this.donutColor, required this.imageName, required this.donutStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        //color: donutColor[50],
        decoration: BoxDecoration(
          color: donutColor[50],
          //esquinas redondeadas
          borderRadius: BorderRadius.circular(24)),
          child: Column(children: [
            Row(
              // alinea el precio a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Container(
                decoration: BoxDecoration(
                  color: donutColor[100],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                padding: const EdgeInsetsDirectional.symmetric(vertical: 8,
                horizontal: 18),
                child: Text(
                  '\$$donutPrice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: donutColor[800]
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      donutFlavor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),),
                    Text(
                      donutStore,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),

              // donut text
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text('Add',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline
                    ),),
                  )
                ],
              )
          ],),
      ),
    );
  }
}