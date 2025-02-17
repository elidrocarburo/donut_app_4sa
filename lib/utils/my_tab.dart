import 'package:flutter/material.dart';
// se crea un stateless porque como son pestañas donde su estado no va a cambiar (no hará cálculos, entre otras cosas)
class MyTab extends StatelessWidget {
  //ruta del archivo donde se guarda la imagen
  final String iconPath;
  const MyTab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Container( // dará formato a los botones
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          //borde redondeado, borderradius es para una forma más general
          borderRadius: BorderRadius.circular(16)
        ),
        child: Image.asset(
          //ruta del archivo
          iconPath,
          color: Colors.grey[600],
          ),
      ),
    );
  }
}