import 'package:elite77/routing/routes.dart';
import 'package:flutter/material.dart';
import '../routing/app_connec.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;

  const CustomAppBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: Container(
          padding: const EdgeInsets.only(left: 10, top: 14),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 16, left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título "ELITE 77" alineado a la izquierda
              const Text(
                "ELITE 77",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.amber),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _navButton(context, Routes.equipo, "EQUIPO"),
                      _navButton(context, Routes.horario, "HORARIO"),
                      _navButton(context, Routes.clases, "CLASES", arguments: {'selectedTitle': null, 'shouldScroll': false}),
                      _navButton(context, Routes.tarifas, "TARIFAS"),
                      _webButton(context, "WEB"),
                      _webButton(context, "DARME DE ALTA"),                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String route, String text, {Map<String, dynamic>? arguments}) {
  String currentRoute = ModalRoute.of(context)?.settings.name ?? '';
  bool isActive = currentRoute == route;

  return Padding(
    padding: const EdgeInsets.only(right: 50), // Margen derecho
    child: TextButton(
      onPressed: () {
        if (!isActive) {
          Navigator.pushNamed(context, route, arguments: arguments ?? {});
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
        children: [
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.amber : Colors.white,
              fontSize: isActive ? 20 : 19.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isActive) // Muestra la línea solo si está activa
            Container(
              margin: const EdgeInsets.only(top: 3), // Espacio entre texto y subrayado
              height: 2.8, // Grosor de la línea
              width: text.length * 13.0, // Ancho proporcional al texto
              color: Colors.amber, // Color del subrayado
            ),
        ],
      ),
    ),
  );
}

Widget _webButton(BuildContext context, String text) {
    final appConnec = AppConnec();
    return Padding(
      padding: const EdgeInsets.only(right: 50), // Margen horizontal (izquierda y derecha)
      child: TextButton(
        onPressed: () => appConnec.openUrl("https://www.elite77.es/"),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 19.5, fontWeight: FontWeight.bold,)),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
