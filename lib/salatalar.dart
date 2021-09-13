import 'package:flutter/material.dart';
import 'package:yemek_tarifi/salatadetay.dart';
import 'package:yemek_tarifi/salatalardb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class salatalar extends StatefulWidget  {
  const salatalar({Key? key}) : super(key: key);

  @override
  _salatalarState createState() => _salatalarState();
}

class _salatalarState extends State<salatalar> {
  Future<List<salatalardb>> salatalarigetir() async{
    var salatalarListesi = <salatalardb>[];
    var y1 = salatalardb(1,"kasik.jpg","Kaşık Salatası","Bu salatanın sırrı tüm malzemeleri olabildiğince küçük ve ince doğrayabilmek.2 adet orta boy domatesi, adeta soğan doğrar gibi küçük küpler halinde kesin.3 adet köy biberini ortadan ikiye kesin ve çekirdeklerini çıkardıktan sonra ince şeritler halinde doğrayın. Ardından bu şeritleri de enlemesine doğrayarak ufak parçalar elde edin.2 tane salatalığı ortadan ikiye kesip, 3 şerit haline getirin ve küp şeklinde doğrayın.1 ufak kırmızı soğanı ortadan ikiye bölün ve yemeklik, küçük küpler halinde doğrayın.İnce kıydığınız 8 dal maydanoz ve 3 dal taze naneyle beraber tüm malzemeyi güzelce bir kasede karıştırın.Refika dokunuşu için de ince halkalar halinde doğradığınız 5 adet salatalık turşusu ve 1 tatlı kaşığı hardal ekleyin.4 çorba kaşığı zeytinyağı ve 1 çay kaşığı tuzu da koyduktan sonra, malzemeleri çok hırpalamadan, lezzetler birbiriyle iyice kaynaşana kadar karıştırın.","2 adet Domates (Orta Boy)2 adet Salatalık3 adet Köy Biberi1 adet Kırmızı Soğan3 dal Taze Nane8 dal Maydanoz1 tatlı kaşığı Hardal5 adet Salatalık Turşusu 4 çorba kaşığı Zeytinyağı 1 çay kaşığı Tuz");
    salatalarListesi.add(y1);

    return salatalarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<salatalardb>>(
      future: salatalarigetir(),
      //yemeklerin gelip gelmediğini anlamak için method oluştururuz
      builder: (context,i){
        if(i.hasData){
          //method liste döndürdüğü için
          var salatalarListesi = i.data;
          return ListView.builder(
            itemCount: salatalarListesi!.length ,

            itemBuilder: (context,index){
              var salata = salatalarListesi[index];
              return SizedBox(
                width: 100,
                height: 150,
                child:Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24,)
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => salatadetay(salata)));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/${salata.salatalardb_resimadi}",height: 240,fit: BoxFit.cover,),
                        Text('${salata.salatalardb_salataadi}',style: TextStyle(
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
