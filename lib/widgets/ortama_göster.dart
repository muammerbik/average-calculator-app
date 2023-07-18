import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_app/constractor/sabitler.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster(
      {required this.ortalama, required this.dersSayisi, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Giriniz',
          style: Sabitler.ortalamaGosterStyle,
        ),
        Text(ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
            style: Sabitler.ortalamaStyle),
        Text('Ortalama', style: Sabitler.ortalamaGosterStyle),
      ],
    );
  }
}
