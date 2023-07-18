import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama_app/constractor/sabitler.dart';
import 'package:ortalama_hesaplama_app/data/data_helper.dart';

import 'ders_sinifi.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikar;
  const DersListesi({required this.onElemanCikar, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (deger) {
                  onElemanCikar(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                          backgroundColor: Sabitler.AnaRenk,
                          child: Text((tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0))),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi,Not degeri : ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
                child: Text(
              'Lütfen Ders Ekleyin',
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
