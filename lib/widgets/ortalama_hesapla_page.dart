import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_app/constractor/sabitler.dart';
import 'package:ortalama_hesaplama_app/data/data_helper.dart';
import 'package:ortalama_hesaplama_app/model/ders_listesi.dart';
import 'package:ortalama_hesaplama_app/widgets/ortama_g%C3%B6ster.dart';

import '../model/ders_sinifi.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDeger = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Sabitler.baslikText, style: Sabitler.baslikStyle),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    ortalama: DataHelper.NotOrtalamasiHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(child: DersListesi(
            onElemanCikar: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });
            },
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: Sabitler.yatayPadding8,
                child: _buildHarfler(),
              )),
              Expanded(
                  child: Padding(
                padding: Sabitler.yatayPadding8,
                child: _buildKrediler(),
              )),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.AnaRenk,
                iconSize: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDeger = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Lütfen Uygun Değer Giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Ders Giriniz',
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.AnaRenk.shade100.withOpacity(0.3)),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        borderRadius: Sabitler.borderRadius,
        color: Sabitler.AnaRenk.shade100.withOpacity(0.3),
      ),
      child: DropdownButton<double>(
        iconEnabledColor: Sabitler.AnaRenk.shade200,
        elevation: 16,
        underline: Container(),
        value: secilenHarfDeger,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger = deger!;
            debugPrint('deger $deger');
          });
        },
        items: DataHelper.tumHarfleriGoster(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        borderRadius: Sabitler.borderRadius,
        color: Sabitler.AnaRenk.shade100.withOpacity(0.3),
      ),
      child: DropdownButton<double>(
        iconEnabledColor: Sabitler.AnaRenk.shade200,
        elevation: 16,
        underline: Container(),
        value: secilenKrediDeger,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            debugPrint('deger $deger');
          });
        },
        items: DataHelper.tumDerslerinKredisi(),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var eklenecekders = Ders(
          ad: girilenDeger,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekders);
      setState(() {});
    }
  }
}
