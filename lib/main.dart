import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_app/constractor/sabitler.dart';
import 'package:ortalama_hesaplama_app/widgets/ortalama_hesapla_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ortalama Hesaplama App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Sabitler.AnaRenk,
      visualDensity:VisualDensity.adaptivePlatformDensity ),
      home: OrtalamaHesaplaPage(),
    );
  }
}
