import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Prepa 1: cómo se va a organizar - griddelegate
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //sliver: scroll personalizable para listas o diseños grandes
        //fixed: número fijo de columnas
        //crossaxis: eje opuesto
        //Número de columnas
        crossAxisCount: 2), 

      //Cuántos elementos
      itemCount: 4,
      padding: const EdgeInsets.all(12),

      //Qué elemento se construirá
      itemBuilder: (context, index) {
        return;
      }
      );
  }
}