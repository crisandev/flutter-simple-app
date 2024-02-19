import 'package:flutter/material.dart';
import 'package:primer_pacial_flutter/util/mainbutton.dart';
import 'package:primer_pacial_flutter/util/textfield.dart';

class MultiplyTable extends StatelessWidget {
  const MultiplyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tabla de Multiplicar")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(child: ListValues())
          ],
        ),
      ),
    );
  }
}

class ListValues extends StatefulWidget {
  const ListValues({super.key});

  @override
  ListValuesState createState() => ListValuesState();
}

class ListValuesState extends State<ListValues> {
  late int newNumber;
  late int currentNumber;

  @override
  void initState() {
    super.initState();
    newNumber = 0;
    currentNumber = 0;
  }

  void changeValue(String number) {
    setState(() {
      newNumber = int.parse(number);
    });
  }

  void showTable() {
    setState(() {
      currentNumber = newNumber;
    });
  }

  List<Widget> buildTable() {
    List<Widget> tableRows = [];

    if (currentNumber != 0) {
      for (var i = 1; i <= 14; i++) {
        int result = i * currentNumber;
        tableRows.add(Card(
          child: ListTile(title: Text("$currentNumber x $i = $result")),
        ));
      }
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFieldNumber(
              hint: "Ingresa un Número",
              label: "Número",
              width: 200,
              onTextChanged: (number) {
                setState(() {
                  changeValue(number);
                });
              }),
          MainButton(
              text: "Multiplicar",
              onPressed: () {
                showTable();
              }),
          Card(
            child: ListTile(
              title: Center(
                child: Text(
                  currentNumber == 0
                      ? "No Hay Tabla Que Multiplicar"
                      : "Tabla del $currentNumber",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildTable(),
          )
        ],
      ),
    );
  }
}
