import 'package:elite77/customize/appbar.dart';
import 'package:elite77/pages/tarifaDetalle.dart';
import 'package:elite77/routing/routes.dart';
import 'package:flutter/material.dart';

class TarifasVista extends StatefulWidget {
  const TarifasVista({super.key});

  @override
  _TarifasVistaState createState() => _TarifasVistaState();
}

class _TarifasVistaState extends State<TarifasVista> {
  // Lista de tarifas (imagen, precio, título, detalles)
  final List<Map<String, String>> tarifas = [
    {
      "imagePath": 'lib/assets/images/menu/PHOTO-2025-03-02-21-36-25.jpg',
      "price": "60€",
      "title": "TARIFA 1",
      "details": "Detalles de Tarifa 1"
    },
    {
      "imagePath": 'lib/assets/images/menu/PHOTO-2025-03-02-21-36-25.jpg',
      "price": "70€",
      "title": "TARIFA 2",
      "details": "Detalles de Tarifa 2"
    },
    {
      "imagePath": 'lib/assets/images/menu/PHOTO-2025-03-02-21-36-25.jpg',
      "price": "80€",
      "title": "TARIFA 3",
      "details": "Detalles de Tarifa 3"
    },
    {
      "imagePath": 'lib/assets/images/menu/PHOTO-2025-03-02-21-36-25.jpg',
      "price": "90€",
      "title": "TARIFA 4",
      "details": "Detalles de Tarifa 4"
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          currentRoute: ModalRoute.of(context)?.settings.name ?? ''),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color.fromARGB(255, 255, 50, 35)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
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
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < tarifas.length; i++)
                      _buildTarifaCard(context, i), // Pasar el índice aquí
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTarifaCard(BuildContext context, int index) {
    final tarifa = tarifas[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return TarifaDetalleVista(selectedIndex: index, tarifas: tarifas,);
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(50),
        child: Container(
          width: 250,
          height: 350,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Hero(
                tag: tarifa["title"]!,
                child: Image.asset(
                  tarifa["imagePath"]!,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                tarifa["price"]!,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
