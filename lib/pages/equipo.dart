import 'package:elite77/customize/appbar.dart';
import 'package:elite77/routing/routes.dart';
import 'package:flutter/material.dart';

class EquipoVista extends StatefulWidget {
  const EquipoVista({super.key});
  
  @override
  _EquipoVistaState createState() => _EquipoVistaState();
}

class _EquipoVistaState extends State<EquipoVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentRoute: ModalRoute.of(context)?.settings.name ?? ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 100.0, left: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 33.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.menu);
                  },
                  child: Image.asset(
                    'lib/assets/logos/elite_box_TEAM_ROJO.png',
                    width: 170,
                    height: 85,
                  ),
                ),
              ),
              // Primera fila con imagen a la izquierda y texto a la derecha
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "lib/assets/images/equipo/EXTREMboxingfitness-43-min-1.jpg", // Cambia esta URL por tu imagen
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 50), // Espacio entre la imagen y el texto
                    const Expanded(
                      child: Text(
                        "Albert, desde pequeño, vive por y para el deporte. Su objetivo es poder transmitir y enseñar todo lo que él ha aprendido y la experiencia adquirida en todo este tiempo, demostrando que el boxeo no solo es un deporte, sino un estilo de vida.\nEmpezó en el mundo del boxeo y la condición física a los 7 años. Después de más de 30 combates amateur, con 22 años da el salto al boxeo profesional y cierra el año 2024 con un récord de 4 combates y 4 victorias.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32), // Espacio entre las filas
              // Segunda fila con imagen a la izquierda y texto a la derecha
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "lib/assets/images/equipo/hgjhgj-scaled.jpg", // Cambia esta URL por tu imagen
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16), // Espacio entre la imagen y el texto
                    const Expanded(
                      child: Text(
                        "Amante del boxeo desde los 12 años, actualmente con 20 peleas en el ámbito amataur. María es todo un ejemplo de esfuerzo y superación, dedicando cada día a aprender los fundamentos y pulir su técnica.\nAmante del boxeo desde los 12 años, actualmente con 20 peleas en el ámbito amataur. María es todo un ejemplo de esfuerzo y superación, dedicando cada día a aprender los fundamentos y pulir su técnica.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
