import 'package:elite77/pages/clases.dart';
import 'package:elite77/pages/equipo.dart';
import 'package:elite77/pages/menu.dart';
import 'package:elite77/pages/horario.dart';
import 'package:elite77/pages/splash.dart';
import 'package:elite77/pages/tarifaDetalle.dart';
import 'package:elite77/pages/tarifas.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashPage(),
    Routes.menu: (context) {
      return const HomeVista(
        title: "Menu Screen",
      );
    },
    Routes.horario: (context) {
      return const HorarioVista();
    },
    Routes.clases: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final selectedTitle = args['selectedTitle'] as String?;
      final shouldScroll = args['shouldScroll'] as bool;
      return ClasesVista(
          selectedTitle: selectedTitle, shouldScroll: shouldScroll);
    },
    Routes.tarifas: (context) {
      return const TarifasVista();
    },
    Routes.tarifasDetalle: (context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      if (arguments == null || !arguments.containsKey("tarifas") || !arguments.containsKey("selectedIndex")) {
        return const Scaffold(
          body: Center(child: Text("Error: No se encontraron datos de la tarifa.")),
        );
      }

      final List<Map<String, String>> tarifas = List<Map<String, String>>.from(arguments["tarifas"]);
      final int selectedIndex = arguments["selectedIndex"] as int;

      return TarifaDetalleVista(
        tarifas: tarifas,
        selectedIndex: selectedIndex,
      );
    },

    Routes.equipo: (context) {
      return const EquipoVista();
    }
  };
}
