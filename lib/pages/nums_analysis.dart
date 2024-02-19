import 'package:flutter/material.dart';
import 'package:primer_pacial_flutter/util/mainbutton.dart';
import 'package:primer_pacial_flutter/util/textfield.dart';

class AnalysisNumbers extends StatefulWidget {
  const AnalysisNumbers({super.key});

  @override
  AnalysisNumbersState createState() => AnalysisNumbersState();
}

class AnalysisNumbersState extends State<AnalysisNumbers> {
  late int num1;
  late int num2;
  late int num3;
  late List<int> currentValues;

  @override
  void initState() {
    super.initState();
    num1 = 0;
    num2 = 0;
    num3 = 0;
    currentValues = [0, 0, 0];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    List<int> nums = [num1, num2, num3];

    List<Widget> analysisNumbers() {
      List<int> cv = currentValues;
      if (cv[0] != 0 && cv[1] != 0 && cv[2] != 0) {
        int maxValue = num1 > num2 ? num1 : num2;
        maxValue = maxValue > num3 ? maxValue : num3;
        list.add(Text(
          "El número Mayor es el $maxValue",
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 4, 18, 30)),
        ));
        nums.remove(maxValue);

        int minValue = nums[0] < nums[1] ? nums[0] : nums[1];
        list.add(Text(
          "El número Minimo es el $minValue",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ));
        nums.remove(minValue);

        String average = ((num1 + num2 + num3) / 3).toStringAsPrecision(3);
        list.add(Text(
          "El promedio de los tres número es: $average",
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 4, 18, 30)),
        ));
        currentValues = [0, 0, 0];
      }
      return list;
    }

    void updateValues() {
      setState(() {
        currentValues[0] = num1;
        currentValues[1] = num2;
        currentValues[2] = num3;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Análisis de Números"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Ingresa Tres Números",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFieldNumber(
                    hint: "Número 1",
                    label: "Número 1",
                    width: 110,
                    onTextChanged: (value) {
                      setState(() {
                        num1 = int.parse(value);
                      });
                    }),
                TextFieldNumber(
                    hint: "Número 2",
                    label: "Número 2",
                    width: 110,
                    onTextChanged: (value) {
                      setState(() {
                        num2 = int.parse(value);
                      });
                    }),
                TextFieldNumber(
                    hint: "Número 3",
                    label: "Número 3",
                    width: 110,
                    onTextChanged: (value) {
                      setState(() {
                        num3 = int.parse(value);
                      });
                    })
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: MainButton(text: "Analizar", onPressed: updateValues),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: analysisNumbers(),
            )
          ],
        ));
  }
}
