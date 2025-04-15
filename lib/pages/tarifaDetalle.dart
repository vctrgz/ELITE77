import 'package:flutter/material.dart';
import 'package:elite77/customize/appbar.dart';

class TarifaDetalleVista extends StatefulWidget {
  final List<Map<String, String>> tarifas;
  final int selectedIndex;

  const TarifaDetalleVista({required this.tarifas, required this.selectedIndex, super.key});

  @override
  _TarifaDetalleVistaState createState() => _TarifaDetalleVistaState();
}

class _TarifaDetalleVistaState extends State<TarifaDetalleVista> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  void _nextTarifa() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.tarifas.length;
    });
  }

  void _prevTarifa() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.tarifas.length) % widget.tarifas.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tarifaActual = widget.tarifas[currentIndex];

    return Scaffold(
      appBar: CustomAppBar(currentRoute: ModalRoute.of(context)?.settings.name ?? ''),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300.0),
                child: ElevatedButton(
                  onPressed: _prevTarifa,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text("<", style: TextStyle(fontSize: 24)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: tarifaActual["title"]!,
                    child: Image.asset(
                      tarifaActual["imagePath"]!,
                      width: 220,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    tarifaActual["price"]!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tarifaActual["details"]!,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300.0),
                child: ElevatedButton(
                  onPressed: _nextTarifa,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text(">", style: TextStyle(fontSize: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
