import 'package:flutter/material.dart';
import 'package:yemek_tarifi/tatlidetay.dart';
import 'package:yemek_tarifi/tatlilardb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class tatlilar extends StatefulWidget  {
  const tatlilar({Key? key}) : super(key: key);

  @override
  _tatlilarState createState() => _tatlilarState();
}

class _tatlilarState extends State<tatlilar> {
  Future<List<tatlilardb>> tatlilarigetir() async {
    var tatlilarListesi = <tatlilardb>[];
    var y1 = tatlilardb(1, "baklava.jpg", "Baklava","    Öncelikle baklava yapımında tatlının şerbetini su ve şekeri bir tencerede kaynatıp hazırlayın.Kaynadıktan sonra kısık ateşte 30 dakika daha kaynatıp soğumaya bırakın.Hamur malzemelerini derin bir kabın içinde karıştırıp, hamuru yoğurun.Dinlenen hamurdan 8 tane beze elde edin.Tezgaha hafif nişasta serperek açabileceğiniz en ince şekilde açın.Fazla nişastayı yufkanın üzerinden atın ve oda sıcaklığında açılan yufkaları 10-15 dakika bekletin.Ardından tepsinin tabanını yağlayın.Açtığınız yufkaların 4 tanesini üst üste koyun.Daha sonra üzerine bolca fıstık ilave edip diğer katlarını da koyun.Baklavanızı dilediğiniz gibi dilim dilim kesin.Üzerine eritilmiş tereyağını da gezdirin.Önceden ısıtılmış 180 derece fırında üzeri kızarıp içi pişene kadar yaklaşık 40 dakika pişirin.Fırından çıkardığınız baklavanın üzerine şerbeti gezdirin.Afiyet olsun.","a");

    tatlilarListesi.add(y1);

    return tatlilarListesi;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<tatlilardb>>(
      future: tatlilarigetir(),
      //yemeklerin gelip gelmediğini anlamak için method oluştururuz
      builder: (context,i){
        if(i.hasData){
          //method liste döndürdüğü için
          var tatlilarListesi = i.data;
          return ListView.builder(
            itemCount: tatlilarListesi!.length ,

            itemBuilder: (context,index){
              var tatli = tatlilarListesi[index];
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => tatlidetay(tatli)));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/${tatli.tatlilar_resimad}",height: 240,fit: BoxFit.cover,),
                        Text('${tatli.tatlilar_tatliadi}',style: TextStyle(
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


