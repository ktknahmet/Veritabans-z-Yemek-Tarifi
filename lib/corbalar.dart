import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi/corbalardb.dart';
import 'package:yemek_tarifi/corbalardetay.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class corbalar extends StatefulWidget  {

  @override
  _corbalarState createState() => _corbalarState();
}

class _corbalarState  extends State<corbalar> {
  Future<List<corbalardb>> corbalarigetir() async{
    var corbalarListesi = <corbalardb>[];
    var y1 = corbalardb(1,"mercimek.jpg","Mercimek Çorbası","Havuç ve patatesi küçük küçük doğrayın.Önceden hazır tuttuğunuz geniş bir tencereye sırasıyla sıvıyağ, soğan, patates ve havuçları alın. Ardından orta ateşte kavurun.Salçaları ekleyin, yıkayıp süzdüğünüz mercimekleri de ekleyin ve güzelce karıştırın.Tencereye tuzu ve suyu da ekledikten sonra kısık ateşte beklemeye bırakın.Kaynayan çorba için ayrı bir kapta hazırladığımız zeytinyağı ve kırmızıbiberden oluşan sosu çorbaya ilave edin.Çorbayı blenderden geçirin. İçerisinde parçacık kalmayana kadar çırpın.Lokanta usulü mercimek çorbası tarifi başarı ile tamamlandı. Afiyet olsun…","1 tatlı kaşığı tuz,1 adet soğan,5 yemek kaşığı sıvıyağ,1 yemek kaşığı biber salçası,1 adet patates,1 adet havuç,7 bardak su,1 su bardağı kırmızı mercimek,1 yemek kaşığı domates salçası");
    corbalarListesi.add(y1);
    return corbalarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<corbalardb>>(
      future: corbalarigetir(),
      //yemeklerin gelip gelmediğini anlamak için method oluştururuz
      builder: (context,i){
        if(i.hasData){
          //method liste döndürdüğü için
          var corbalarListesi = i.data;
          return ListView.builder(
            itemCount:corbalarListesi!.length ,

            itemBuilder: (context,index){
              var corba =corbalarListesi[index];
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => corbalardetay(corba)));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/${corba.corbalardb_resimad}",height: 240,fit: BoxFit.cover,),
                        Text('${corba.corbalardb_corbaadi}',style: TextStyle(
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


