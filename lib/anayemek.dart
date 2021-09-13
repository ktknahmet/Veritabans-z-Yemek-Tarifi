import 'package:flutter/material.dart';
import 'package:yemek_tarifi/anayemekdb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yemek_tarifi/anayemekdetay.dart';

class anayemek extends StatefulWidget  {
  const anayemek({Key? key}) : super(key: key);

  @override
  _anayemekState createState() => _anayemekState();
}

class _anayemekState extends State<anayemek> {

  Future<List<anayemekdb>> anayemeklerigetir() async {
    var anayemeklerListesi = <anayemekdb>[];
    var y1 = anayemekdb(1,"koftee.jpg", "Sebzeli Misket Köftte","Soğan ve sarımsağı robotta püre şeklinde kıyıp köftelik yazdığım tüm malzemeyi ekleyelim ve birlikte yoğuralım.Son olarak üzerini kapayıp buzdolabında en az yarım saat dinlendirelim.Patlıcanları alaca şekilde soyalım, tüm sebzeleri eşit büyüklükte olacak şekilde orta boyutta küplere keselim (köfte ile aynı uyumda olacak şekilde ayarlayalım).Geniş ve derin bir tepsi içerisine tüm doğranmış sebzeleri biriktirelim.Üzerlerine tuz ve zeytinyağını gezdirip elle güzelce karıştıralım.Daha sonra malzemeyi pişirme kabımıza döküp önceden ısınmış fansız alt üst ayarda 200° de alttan ikinci rafta 25 dakika pişirelim.Bizde bu sırada dolapta hazır bekleyen kıymaya ceviz büyüklüğünde iri misket top şekli verip elde yuvarlayalım.Süre sonunda sebzeleri fırından çıkarıp üzerlerine gelişi güzel köfteleri yerleştirelim.Sosu için bir tasta tüm malzemeyi çırpalım ve köftelerin sebzelerin üzerine kaşıkla gezdirerek dökelim.1 adet fırın kağıdını muslukta ıslatıp suyunu sıkalım. Ve tepsin üzerine kapak şeklinde kapayarak örtelim.Yine ikinci rafa, 45 dakikalığına fırına verelim. Süre sonunda üzerinden kağıdını alıp çatalla sebzeleri kontrol edip eğer piştiyse, kağıdını üzerinden tamamen alıp, 10-15 dakikada üzeri açık şekilde kızartarak pişirelim ve servis edelim.","");
    anayemeklerListesi.add(y1);

    return anayemeklerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<anayemekdb>>(
      future: anayemeklerigetir(),
      //yemeklerin gelip gelmediğini anlamak için method oluştururuz
      builder: (context,i){
        if(i.hasData){
          //method liste döndürdüğü için
          var anayemeklerListesi = i.data;
          return ListView.builder(
            itemCount:anayemeklerListesi!.length ,

            itemBuilder: (context,index){
              var yemek =anayemeklerListesi[index];
              return SizedBox(
                width: 100,
                height: 200,
                child:Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24,)
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => anayemekdetay(yemek)));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/${yemek.anayemekdb_resimad}",height: 240,fit: BoxFit.cover,),
                        Text('${yemek.anayemekdb_anayemekadi}',style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.white,
                          fontSize: 24,
                        ),)
                      ],
                    ),
                  ),
                ),

              );

            },
          );
        }else{
          return Center();
        }
      },
    );
  }
}

