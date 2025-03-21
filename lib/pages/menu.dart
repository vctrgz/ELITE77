import 'package:elite77/routing/routes.dart';
import 'package:flutter/material.dart';
import '../routing/app_connec.dart';

class HomeVista extends StatefulWidget {
  final String title;
  const HomeVista({super.key, required this.title});
  
  @override
  _HomeVistaState createState() => _HomeVistaState();
}

class _HomeVistaState extends State<HomeVista> {

  final AppConnec appConnec = AppConnec(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: const Text("ELITE 77")),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(50),
        childAspectRatio: (1 / .5),
        crossAxisSpacing: 100,
        mainAxisSpacing: 100,
        children: [
          _buildButton("EQUIPO", () => Navigator.pushNamed(context, Routes.equipo, arguments: {})),
          _buildButton("HORARIOS", () => Navigator.pushNamed(context, Routes.horario, arguments: {}), imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg"),
          _buildButton("CLASES", () => Navigator.pushNamed(context, Routes.clases, arguments: {'selectedTitle': null, 'shouldScroll': false},)),
          _buildButton("TARIFAS", () => Navigator.pushNamed(context, Routes.tarifas, arguments: {})),
          _buildButton("WEB", () => appConnec.openUrl("https://www.elite77.es/")),
          _buildButton("DARME DE ALTA", appConnec.openExternalApp),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, {String? imageUrl}) {
  return Container(
    width: 150,  // Ancho del botón
    height: 100, // Alto del botón
    decoration: BoxDecoration(
      color: imageUrl != null ? Colors.transparent : null, // Fondo transparente si hay imagen
      borderRadius: BorderRadius.circular(15), // Bordes redondeados
      image: imageUrl != null
          ? DecorationImage(
              image: NetworkImage(imageUrl),  // Usando imageUrl proporcionado
              fit: BoxFit.cover, // Ajusta la imagen al botón
            )
          : null,
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(0), // Elimina el padding para mantener el tamaño
        textStyle: const TextStyle(fontSize: 14), // Color del texto
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: imageUrl != null ? Colors.white : Colors.black),
        ),
      ),
    ),
  );
}
}