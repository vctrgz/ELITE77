import 'package:elite77/customize/appbar.dart';
import 'package:flutter/material.dart';

class TarifasVista extends StatefulWidget {
  const TarifasVista({super.key});
  
  @override
  _TarifasVistaState createState() => _TarifasVistaState();
}

class _TarifasVistaState extends State<TarifasVista> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentRoute: ModalRoute.of(context)?.settings.name ?? ''),
      body: SingleChildScrollView( // Permite desplazamiento
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildExpansionTile(
                title: "Tarifa 1",
                content:
                    "Contenido 1",
                precio: "60€",
              ),
              _buildExpansionTile(
                title: "Tarifa 2",
                content:
                    "Contenido 2",
                precio: "70€",
              ),
              _buildExpansionTile(
                title: "Tarifa 3",
                content:
                    "Contenido 3",
                precio: "80€",
              ),
              _buildExpansionTile(
                title: "Tarifa 4",
                content:
                    "Contenido 4",
                precio: "90€",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionTile({required String title, required String content, required String precio}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 36.0, left: 150, right: 100), // Espacio entre cada ExpansionTile
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados para la imagen
          child: Text(
            precio,
            style: const TextStyle(fontSize: 50),
          ),
        ),
        const SizedBox(width: 16), // Espacio entre la imagen y el ExpansionTile
        Expanded(
          child: ExpansionTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  content.trim(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}