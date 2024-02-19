import 'package:flutter/material.dart';
import 'package:primer_pacial_flutter/util/mainbutton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final String imageURL = "assets/images/foto.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Presentación"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageURL, width: 300, height: 300),
                const Text(
                  "Cristian Sánchez",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                MainButton(
                    text: "Tabla de Multiplicar",
                    onPressed: () {
                      Navigator.pushNamed(context, "/multiplytable");
                    }),
                MainButton(
                    text: 'Análisis de Números',
                    onPressed: () {
                      Navigator.pushNamed(context, "/analysisnumber");
                    })
              ]),
        ));
  }
}
