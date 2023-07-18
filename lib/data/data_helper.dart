import 'package:flutter/material.dart';

import '../model/ders_sinifi.dart';

class DataHelper {
  static List<String> _tumHarleriGoster() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumHarfleriGoster() {
    return _tumHarleriGoster()
        .map((e) => DropdownMenuItem(child: Text(e), value: _harfiNotaCevir(e)))
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredisi() {
    return _tumKrediler()
        .map((e) =>
            DropdownMenuItem(child: Text(e.toString()), value: e.toDouble()))
        .toList();
  }

  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double NotOrtalamasiHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.harfDegeri * element.krediDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }
}
