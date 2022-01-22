// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';

class StudentPreview extends StatelessWidget {
  final String image;
  final VoidCallback onClicked;
  final bool isEdit;

  StudentPreview(
      {Key? key,
      required this.image,
      this.isEdit = false,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
        child: Stack(children: [
      buildImage(),
    ]));
  }

  Widget buildImage() {
    final imagepfp = NetworkImage(image);

    return ClipOval(
        child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: imagepfp,
        fit: BoxFit.cover,
        width: 128,
        height: 128,
        child: InkWell(
          onTap: onClicked,
        ),
      ),
    ));
  }
}
