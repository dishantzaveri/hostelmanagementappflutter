import 'package:flutter/cupertino.dart';

class MyUser{
   final String imagePath;
  final String name;
  final String email;
  final String roomno;
  final String foodpack;

 const MyUser({
  required this.imagePath,
  required this.email,
  required this.foodpack,
  required this.name,
  required this.roomno,

});
}