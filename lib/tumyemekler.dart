import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi/anayemekdb.dart';
import 'package:yemek_tarifi/corbalardb.dart';
import 'package:yemek_tarifi/salatalardb.dart';
import 'package:yemek_tarifi/tatlilardb.dart';
import 'package:yemek_tarifi/tumyemeklerdb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class tumyemekler extends StatefulWidget  {
  const tumyemekler({Key? key}) : super(key: key);

  @override
  _tumyemeklerState createState() => _tumyemeklerState();
}

class _tumyemeklerState extends State<tumyemekler> {

  Future<List<tumyemeklerdb>> yemeklerigetir() async{
    var tumyemeklerListesi = <tumyemeklerdb>[];
    var a1 = anayemekdb(1,"koftee.jpg", "Sebzeli Misket Köftte","Soğan ve sarımsağı robotta püre şeklinde kıyıp köftelik yazdığım tüm malzemeyi ekleyelim ve birlikte yoğuralım.Son olarak üzerini kapayıp buzdolabında en az yarım saat dinlendirelim.Patlıcanları alaca şekilde soyalım, tüm sebzeleri eşit büyüklükte olacak şekilde orta boyutta küplere keselim (köfte ile aynı uyumda olacak şekilde ayarlayalım).Geniş ve derin bir tepsi içerisine tüm doğranmış sebzeleri biriktirelim.Üzerlerine tuz ve zeytinyağını gezdirip elle güzelce karıştıralım.Daha sonra malzemeyi pişirme kabımıza döküp önceden ısınmış fansız alt üst ayarda 200° de alttan ikinci rafta 25 dakika pişirelim.Bizde bu sırada dolapta hazır bekleyen kıymaya ceviz büyüklüğünde iri misket top şekli verip elde yuvarlayalım.Süre sonunda sebzeleri fırından çıkarıp üzerlerine gelişi güzel köfteleri yerleştirelim.Sosu için bir tasta tüm malzemeyi çırpalım ve köftelerin sebzelerin üzerine kaşıkla gezdirerek dökelim.1 adet fırın kağıdını muslukta ıslatıp suyunu sıkalım. Ve tepsin üzerine kapak şeklinde kapayarak örtelim.Yine ikinci rafa, 45 dakikalığına fırına verelim. Süre sonunda üzerinden kağıdını alıp çatalla sebzeleri kontrol edip eğer piştiyse, kağıdını üzerinden tamamen alıp, 10-15 dakikada üzeri açık şekilde kızartarak pişirelim ve servis edelim.","");
    var c1 = corbalardb(1,"mercimek.jpg","Mercimek Çorbası","Havuç ve patatesi küçük küçük doğrayın.Önceden hazır tuttuğunuz geniş bir tencereye sırasıyla sıvıyağ, soğan, patates ve havuçları alın. Ardından orta ateşte kavurun.Salçaları ekleyin, yıkayıp süzdüğünüz mercimekleri de ekleyin ve güzelce karıştırın.Tencereye tuzu ve suyu da ekledikten sonra kısık ateşte beklemeye bırakın.Kaynayan çorba için ayrı bir kapta hazırladığımız zeytinyağı ve kırmızıbiberden oluşan sosu çorbaya ilave edin.Çorbayı blenderden geçirin. İçerisinde parçacık kalmayana kadar çırpın.Lokanta usulü mercimek çorbası tarifi başarı ile tamamlandı. Afiyet olsun…","1 tatlı kaşığı tuz,1 adet soğan,5 yemek kaşığı sıvıyağ,1 yemek kaşığı biber salçası,1 adet patates,1 adet havuç,7 bardak su,1 su bardağı kırmızı mercimek,1 yemek kaşığı domates salçası");
    var s1 = salatalardb(1,"kasik.jpg","Kaşık Salatası","Bu salatanın sırrı tüm malzemeleri olabildiğince küçük ve ince doğrayabilmek.2 adet orta boy domatesi, adeta soğan doğrar gibi küçük küpler halinde kesin.3 adet köy biberini ortadan ikiye kesin ve çekirdeklerini çıkardıktan sonra ince şeritler halinde doğrayın. Ardından bu şeritleri de enlemesine doğrayarak ufak parçalar elde edin.2 tane salatalığı ortadan ikiye kesip, 3 şerit haline getirin ve küp şeklinde doğrayın.1 ufak kırmızı soğanı ortadan ikiye bölün ve yemeklik, küçük küpler halinde doğrayın.İnce kıydığınız 8 dal maydanoz ve 3 dal taze naneyle beraber tüm malzemeyi güzelce bir kasede karıştırın.Refika dokunuşu için de ince halkalar halinde doğradığınız 5 adet salatalık turşusu ve 1 tatlı kaşığı hardal ekleyin.4 çorba kaşığı zeytinyağı ve 1 çay kaşığı tuzu da koyduktan sonra, malzemeleri çok hırpalamadan, lezzetler birbiriyle iyice kaynaşana kadar karıştırın.","2 adet Domates (Orta Boy)2 adet Salatalık3 adet Köy Biberi1 adet Kırmızı Soğan3 dal Taze Nane8 dal Maydanoz1 tatlı kaşığı Hardal5 adet Salatalık Turşusu 4 çorba kaşığı Zeytinyağı 1 çay kaşığı Tuz");
    var t1 = tatlilardb(1, "baklava.jpg", "Baklava","    Öncelikle baklava yapımında tatlının şerbetini su ve şekeri bir tencerede kaynatıp hazırlayın.Kaynadıktan sonra kısık ateşte 30 dakika daha kaynatıp soğumaya bırakın.Hamur malzemelerini derin bir kabın içinde karıştırıp, hamuru yoğurun.Dinlenen hamurdan 8 tane beze elde edin.Tezgaha hafif nişasta serperek açabileceğiniz en ince şekilde açın.Fazla nişastayı yufkanın üzerinden atın ve oda sıcaklığında açılan yufkaları 10-15 dakika bekletin.Ardından tepsinin tabanını yağlayın.Açtığınız yufkaların 4 tanesini üst üste koyun.Daha sonra üzerine bolca fıstık ilave edip diğer katlarını da koyun.Baklavanızı dilediğiniz gibi dilim dilim kesin.Üzerine eritilmiş tereyağını da gezdirin.Önceden ısıtılmış 180 derece fırında üzeri kızarıp içi pişene kadar yaklaşık 40 dakika pişirin.Fırından çıkardığınız baklavanın üzerine şerbeti gezdirin.Afiyet olsun.","a");
    var tumyemek = tumyemeklerdb(t1,s1,c1,a1);
    tumyemeklerListesi.add(tumyemek);
    return tumyemeklerListesi;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<tumyemeklerdb>>(
      future: yemeklerigetir(),
      //yemeklerin gelip gelmediğini anlamak için method oluştururuz
      builder: (context,i){
        if(i.hasData){
          //method liste döndürdüğü için
          var tumyemeklerListesi = i.data;
          return ListView.builder(
            itemCount: tumyemeklerListesi!.length ,

            itemBuilder: (context,index){
              var tumyemekler = tumyemeklerListesi[index];
              return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24,)
                  ),
                  child: GestureDetector(
                    onTap: (){
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => corbalardetay(corba)));
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset("images/${tumyemekler.tatli.tatlilar_resimad}",height: 240,fit: BoxFit.cover,),
                          Image.asset("images/${tumyemekler.salatalar.salatalardb_resimadi}",height: 240,fit: BoxFit.cover,),
                          Image.asset("images/${tumyemekler.corbalar.corbalardb_resimad}",height: 240,fit: BoxFit.cover,),
                          Image.asset("images/${tumyemekler.anayemek.anayemekdb_resimad}",height: 240,fit: BoxFit.cover,),
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
