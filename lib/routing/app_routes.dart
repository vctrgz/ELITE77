import 'package:elite77/pages/clases.dart';
import 'package:elite77/pages/equipo.dart';
import 'package:elite77/pages/menu.dart';
import 'package:elite77/pages/horario.dart';
import 'package:elite77/pages/splash.dart';
import 'package:elite77/pages/tarifas.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashPage(),
    Routes.home: (context) {
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
    Routes.equipo: (context) {
      return const EquipoVista();
    }
  };
}
