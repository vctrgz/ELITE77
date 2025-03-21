import 'package:elite77/customize/appbar.dart';
import 'package:flutter/material.dart';

class ClasesVista extends StatefulWidget {
  final String? selectedTitle;
  final bool shouldScroll;

  const ClasesVista({super.key, this.selectedTitle, required this.shouldScroll});

  @override
  _ClasesVistaState createState() => _ClasesVistaState();
}

class _ClasesVistaState extends State<ClasesVista> {
  late ScrollController _scrollController;
  late List<GlobalKey> _tileKeys;
  late List<ValueNotifier<bool>> _expansionStates;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tileKeys = List.generate(6, (_) => GlobalKey());
    _expansionStates = List.generate(6, (_) => ValueNotifier<bool>(false));

    if (widget.shouldScroll && widget.selectedTitle != null) {
      int index = getIndexForTitle(widget.selectedTitle!);
      _expansionStates[index].value = true; // Establecer el estado de expansión
      // Usamos Future.delayed para asegurarnos de que los widgets estén construidos antes de hacer scroll
      Future.delayed(Duration(milliseconds: 300), () {
        _scrollToExpandedTile(index);
      });
    }
  }

  int getIndexForTitle(String title) {
    switch (title) {
      case "WOD&BOX":
        return 0;
      case "HIIT":
        return 1;
      case "GAP":
        return 2;
      case "BOXING SKILLS":
        return 3;
      case "POWER PUNCH":
        return 4;
      case "COMBAT SCHOOL":
        return 5;
      default:
        return 0; // Valor predeterminado
    }
  }

  void _scrollToExpandedTile(int index) {
    final context = _tileKeys[index].currentContext;
    if (context != null) {
      final position = context.findRenderObject() as RenderBox?;
      final offset = position?.localToGlobal(Offset.zero);
      if (offset != null) {
        final appBarHeight = AppBar().preferredSize.height;
        _scrollController.animateTo(
          offset.dy - appBarHeight,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (var state in _expansionStates) {
      state.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentRoute: ModalRoute.of(context)?.settings.name ?? ''),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Color.fromARGB(255, 255, 50, 35)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    _buildExpansionTile(
                      title: "WOD&BOX",
                      content:
                          "Esta clase es una combinación de entrenamiento funcional y boxeo. Un bloque de entrenamiento de fuerza, cardio, resistencia y finalizaremos la sesión con boxeo en el saco.\nAFORO 16 personas",
                      imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg",
                      index: 0,
                    ),
                    _buildExpansionTile(
                      title: "HIIT",
                      content:
                          "Esta clase será en forma de circuito, un total de 12 ejercicios/estaciones, en las que trabajaremos todo el cuerpo en diferentes fases. Tendremos que lograr hacer 3 rondas del circuito y finalizaremos la sesión con estiramientos. (En esta sesión no habrá parte de boxeo, solo será entrenamiento funcional).\nAFORO 12 personas",
                      imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg",
                      index: 1,
                    ),
                    _buildExpansionTile(
                      title: "GAP",
                      content:
                          "Esta clase está dirigida en exclusiva a las partes del cuerpo de glúteo, abdomen y pierna. En esta sesión no habrá boxeo.\nAFORO 12 personas",
                      imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg",
                      index: 2,
                    ),
                    _buildExpansionTile(
                      title: "BOXING SKILLS",
                      content:
                          "Esta sesión está basada en trabajar puramente combinaciones en parejas para mejorar la técnica, defensas, movilidad… no habrá trabajo de saco. Material obligatorio: vendas y guantes.\nAFORO 20 personas",
                      imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg",
                      index: 3,
                    ),
                    _buildExpansionTile(
                      title: "POWER PUNCH",
                      content:
                          "Sesión dirigida en la que trabajaremos distintas combinaciones y intervalos para mejorar nuestro cardio y nuestra pegada. Es una clase de alta intensidad en la que quemaremos muchas calorías. Material obligatorio: vendas y guantes.\nAFORO 15 personas",
                      imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg",
                      index: 4,
                    ),
                    _buildExpansionTile(
                      title: "COMBAT SCHOOL",
                      content:
                          "'Escuela de Combate' es una clase orientada a la práctica activa y aplicada del boxeo, con un enfoque en el desarrollo de habilidades para situaciones reales de combate. Aquí se trabaja tanto la parte técnica como la estratégica, poniendo énfasis en el sparring y en cómo aplicar lo aprendido en un escenario más dinámico. Material obligatorio: vendas, guantes, bucal y casco.\nAFORO 20 personas",
                      imageUrl: "lib/assets/PHOTO-2025-03-02-21-36-25.jpg",
                      index: 5,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpansionTile({required String title, required String content, required String imageUrl, required int index}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36.0, left: 150, right: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 190,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: _expansionStates[index],
              builder: (context, isExpanded, child) {
                return ExpansionTile(
                  key: _tileKeys[index],
                  initiallyExpanded: isExpanded,
                  title: Text(
                    title,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        content.trim(),
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
