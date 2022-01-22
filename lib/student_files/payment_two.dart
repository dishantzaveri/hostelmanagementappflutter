import 'dart:ffi';

class Mypay {
  final bool pending;
  final double fee;

  const Mypay({
    required this.pending,
    required this.fee,
  });
}
