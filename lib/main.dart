import 'package:elite77/routing/app_routes.dart';
import 'package:elite77/routing/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ELITE 77',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const VistaA(title: '',), // Pantalla inicial
      routes: appRoutes,
      initialRoute: Routes.splash,
    );
  }
}