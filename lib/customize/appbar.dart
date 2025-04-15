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
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos
            children: [
              // LOGO alineado a la izquierda
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.menu);
                },
                child: Image.asset(
                  'lib/assets/logos/elite_box_TEAM_ROJO.png',
                  width: 100, 
                  height: 50,
                ),
              ),
              // Botones de navegación con Wrap para adaptabilidad
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double availableWidth = constraints.maxWidth;
                      double spacing = 0; // Ajusta el espacio según el ancho
                      double fontSize = 19.5; // Valor por defecto de la fuente

                      // Ajuste de espaciado y tamaño de la letra según el ancho
                      if (availableWidth > 1000) {
                        spacing = 50;
                        fontSize = 19.5; // Letra más grande en pantallas grandes
                      } else if (availableWidth > 900 && availableWidth <= 1000) {
                        spacing = 40;
                        fontSize = 19; // Letra ligeramente más grande
                      } else if (availableWidth > 800 && availableWidth <= 900) {
                        spacing = 30;
                        fontSize = 18.5; // Letra ligeramente más grande
                      }  else if (availableWidth > 700 && availableWidth <= 800) {
                        spacing = 20;
                        fontSize = 18; // Letra mediana
                      } else if (availableWidth <= 700) {
                        spacing = 10;
                        fontSize = 17.5; // Letra más pequeña en pantallas muy pequeñas
                      }
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: spacing, // Espaciado dinámico
                        runSpacing: 5,
                        children: [
                          _navButton(context, Routes.equipo, "EQUIPO", fontSize: fontSize),
                          _navButton(context, Routes.horario, "HORARIO", fontSize: fontSize),
                          _navButton(context, Routes.clases, "CLASES",
                              arguments: {'selectedTitle': null, 'shouldScroll': false}, fontSize: fontSize),
                          _navButton(context, Routes.tarifas, "TARIFAS", fontSize: fontSize),
                          _webButton(context, "WEB", fontSize: fontSize),
                          _webButton(context, "DARME DE ALTA", fontSize: fontSize),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget _navButton(BuildContext context, String route, String text, {Map<String, dynamic>? arguments, double fontSize = 19.5}) {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    bool isActive = currentRoute == route;

    return TextButton(
      onPressed: () {
        if (!isActive) {
          Navigator.pushNamed(context, route, arguments: arguments ?? {});
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.amber : Colors.white,
              fontSize: isActive ? fontSize + 0.5 : fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2.8,
              width: text.length * 13.0,
              color: Colors.amber,
            ),
        ],
      ),
    );
  }

  Widget _webButton(BuildContext context, String text, {double fontSize = 19.5}) {
    final appConnec = AppConnec();
    return TextButton(
      onPressed: () => appConnec.openUrlInChrome("https://www.elite77.es/"),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
