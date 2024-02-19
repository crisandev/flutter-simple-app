import 'package:flutter/material.dart';

class TextFieldNumber extends StatefulWidget {
  final String hint;
  final String label;
  final double width;
  final void Function(String) onTextChanged;

  const TextFieldNumber(
      {super.key,
      required this.hint,
      required this.label,
      required this.width,
      required this.onTextChanged});

  @override
  TextFieldNumberState createState() => TextFieldNumberState();
}

class TextFieldNumberState extends State<TextFieldNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: widget.width,
        child: TextField(
          onChanged: (widget.onTextChanged),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: widget.hint,
              labelText: widget.label,
              border: const OutlineInputBorder()),
        ),
      ),
    );
  }
}
