import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:easydorm/constants.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final int max;
  final ValueChanged<String> onChanged;
  const TextFieldWidget(
      {Key? key,
      this.max = 1,
      required this.label,
      required this.onChanged,
      required this.text})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 5),
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: greyColor,
                fontFamily: "Oxygen",
                fontSize: 20,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
            controller: controller,
            maxLines: widget.max,
          )
        ],
      );
}
