import 'package:elite77/customize/appbar.dart';
import 'package:elite77/pages/clases.dart';
import 'package:elite77/routing/routes.dart';
import 'package:flutter/material.dart';

class HorarioVista extends StatefulWidget {
  const HorarioVista({super.key});

  @override
  _HorarioVistaState createState() => _HorarioVistaState();
}

class _HorarioVistaState extends State<HorarioVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentRoute: ModalRoute.of(context)?.settings.name ?? ''),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(255, 255, 50, 35)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(children: [
            SizedBox(height: constraints.maxHeight * 0.05),
            const Text(
              "ELITE 77",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.02), // Espaciado
            Expanded(
              child: buildTable(constraints),
            ),
          ]),
        );
      }),
    );
  }

  Widget buildTable(BoxConstraints constraints) {
    List<String> headers = [
      "LUNES",
      "MARTES",
      "MIÉRCOLES",
      "JUEVES",
      "VIERNES",
      "SÁBADO",
      "DOMINGO"
    ];
    List<String> horas = [
      "7:00",
      "8:00",
      "9:00",
      "10:00",
      "11:00",
      "13:00",
      "16:00",
      "17:00",
      "18:00",
      "19:00",
      "20:00"
    ];

    double cellHeight = constraints.maxHeight * 0.065;

    Map<String, Color> cellColors = {
      "WOD&BOX": const Color.fromARGB(189, 255, 255, 255),
      "BOXING SKILLS": const Color.fromARGB(255, 206, 203, 203),
      "COMBAT SCHOOL": const Color.fromARGB(255, 206, 203, 203),
      "HIIT": const Color.fromARGB(255, 206, 203, 203),
      "POWER PUNCH": const Color.fromARGB(255, 206, 203, 203),
      "FULL TRAINING": const Color.fromARGB(255, 206, 203, 203),
      "GAP": const Color.fromARGB(255, 206, 203, 203),
      "BOXEO INFANTIL": const Color.fromARGB(255, 206, 203, 203),
      "HIIT/BOXING SKILLS": const Color.fromARGB(255, 206, 203, 203),
      "GAP/COMBAT SCHOOL": const Color.fromARGB(255, 206, 203, 203),
    };

    Map<String, Color> textColors = {
      "WOD&BOX": Colors.red.shade900,
      "BOXING SKILLS": Colors.red.shade900,
      "COMBAT SCHOOL": Colors.red.shade900,
      "HIIT": Colors.red.shade900,
      "POWER PUNCH": Colors.red.shade900,
      "FULL TRAINING": Colors.red.shade900,
      "GAP": Colors.red.shade900,
      "BOXEO INFANTIL": Colors.red.shade900,
      "HIIT/BOXING SKILLS": Colors.red.shade900,
      "GAP/COMBAT SCHOOL": Colors.red.shade900,
    };

    Map<Tuple<int, int>, Color> customCellColors = {
      Tuple(5, 0): const Color.fromARGB(255, 93, 18, 18),
      Tuple(5, 1): const Color.fromARGB(255, 93, 18, 18),
      Tuple(5, 2): const Color.fromARGB(255, 93, 18, 18),
      Tuple(5, 3): const Color.fromARGB(255, 93, 18, 18),
      Tuple(5, 4): const Color.fromARGB(255, 93, 18, 18),
      Tuple(5, 5): const Color.fromARGB(255, 93, 18, 18),
      Tuple(5, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(4, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(3, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(2, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(1, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(0, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(6, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(7, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(8, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(9, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(10, 6): const Color.fromARGB(255, 93, 18, 18),
      Tuple(10, 5): const Color.fromARGB(255, 93, 18, 18),
      Tuple(6, 5): const Color.fromARGB(255, 93, 18, 18),
      Tuple(7, 5): const Color.fromARGB(255, 93, 18, 18),
      Tuple(8, 5): const Color.fromARGB(255, 93, 18, 18),
      Tuple(9, 5): const Color.fromARGB(255, 93, 18, 18),
      Tuple(0, 9): const Color.fromARGB(255, 206, 203, 203),
      Tuple(2, 9): const Color.fromARGB(255, 206, 203, 203),
    };

    List<List<String?>> celdas = [
      [null, "WOD&BOX", null, "BOXING SKILLS", null, null, null],
      [
        "WOD&BOX",
        "BOXING SKILLS",
        "COMBAT SCHOOL",
        "HIIT",
        "POWER PUNCH",
        "FULL TRAINING",
        null
      ],
      [null, null, "GAP", null, null, "FULL TRAINING", null],
      [
        "BOXING SKILLS",
        "POWER PUNCH",
        "COMBAT SCHOOL",
        "BOXING SKILLS",
        "COMBAT SCHOOL",
        null,
        null
      ],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, "HIIT", null, "POWER PUNCH", "COMBAT SCHOOL", null, null],
      [
        "POWER PUNCH",
        "BOXEO INFANTIL",
        "BOXING SKILLS",
        "BOXEO INFANTIL",
        "HIIT",
        null,
        null
      ],
      [
        "HIIT/BOXING SKILLS",
        "POWER PUNCH",
        "GAP/COMBAT SCHOOL",
        "BOXING SKILLS",
        "COMBAT SCHOOL",
        null,
        null
      ],
      ["WOD&BOX", "BOXING SKILLS", "COMBAT SCHOOL", "HIIT", null, null, null],
    ];

    return Center(
      child: SizedBox(
        width: constraints.maxWidth * 0.9,
        height: constraints.maxHeight * 0.8,
        child: Table(
          border: TableBorder.all(color: Colors.white, width: 1),
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.red.shade900),
              children: [Container()] +
                  headers.map((e) => buildHeaderCell(e, cellHeight)).toList(),
            ),
            ...List.generate(horas.length, (rowIndex) {
              return TableRow(
                children: [
                  buildHeaderCell(horas[rowIndex], cellHeight),
                  ...List.generate(headers.length, (colIndex) {
                    String? text = celdas[rowIndex][colIndex];
                    if (text != null && text.contains("/")) {
                      // Si la celda contiene dos clases, dividimos en dos celdas
                      List<String> classes = text.split("/");
                      return buildSplitCell(classes, cellHeight, colIndex, rowIndex, cellColors, textColors);
                    } else {
                    Color cellColor =
                        customCellColors[Tuple(rowIndex, colIndex)] ??
                            cellColors[text] ??
                            Colors.red.shade900;
                    Color textColor = textColors[text] ?? Colors.white;
                    return buildCell(text, cellColor, textColor, cellHeight);
                      
                    }
                  })
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Container buildHeaderCell(String text, double height) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 50, 39),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
            fontFamily: 'Verdana',
            color: Colors.white),
      ),
    );
  }

  Widget buildSplitCell(
    List<String> classes,
    double height,
    int colIndex,
    int rowIndex,
    Map<String, Color> cellColors,
    Map<String, Color> textColors,
  ) {
    return Column(
      children: List.generate(classes.length, (index) {
        String classText = classes[index];
        Color cellColor = cellColors[classText] ?? Colors.red.shade900;
        Color textColor = textColors[classText] ?? Colors.white;
        return buildCell(classText, cellColor, textColor, height / 2, isSplit: true);
      }),
    );

  }

  Widget buildCell(
      String? text, Color cellColor, Color textColor, double height, {bool isSplit = false}) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: GestureDetector(
        onTap: () {
          if (text != null) {
            // Redirige a la nueva pantalla con los detalles de la clase
            Navigator.pushNamed(
              context,
              Routes.clases,
              arguments: {
                'selectedTitle': text,
                'shouldScroll': true, // Indicar que debe desplazarse
              },
            );
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(1),
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: cellColor,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Text(
            text ?? "",
            style: TextStyle(
                fontSize: isSplit ? 11 : 11, 
                fontWeight: FontWeight.bold, 
                color: textColor
              ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple(this.item1, this.item2);

  @override
  bool operator ==(Object other) =>
      other is Tuple<T1, T2> && other.item1 == item1 && other.item2 == item2;

  @override
  int get hashCode => item1.hashCode ^ item2.hashCode;
}
