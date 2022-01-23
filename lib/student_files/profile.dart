// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:easydorm/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String image;
  final VoidCallback onClicked;
  final bool isEdit;

  Profile(
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

  Widget buildEditIcon(Color color) => buildCircle(
        color: primaryPurple,
        all: 8,
        child: Icon(
          isEdit ? Icons.add_a_photo_rounded : Icons.edit,
          color: whiteColor,
          size: 20,
        ),
      );

  Widget buildCircle(
          {required Color color, required double all, required Icon child}) =>
      ClipOval(
        child: Container(
          child: child,
          color: color,
          padding: EdgeInsets.all(all),
        ),
      );
}
