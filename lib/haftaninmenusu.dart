import 'package:flutter/material.dart';
import 'package:yemek_tarifi/haftaninmenusudb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class haftaninmenusu extends StatefulWidget  {
  const haftaninmenusu({Key? key}) : super(key: key);

  @override
  _haftaninmenusuState createState() => _haftaninmenusuState();
}

class _haftaninmenusuState extends State<haftaninmenusu> {
  Future<List<haftaninmenusudb>> menugetir() async {
    var haftaninmenusuListesi = <haftaninmenusudb>[];
    var y1 = haftaninmenusudb(1, "index.jpg", "ana yemek");
    var y2 = haftaninmenusudb(1, "index.jpg", "süzme mercimek çorbası");
    var y3 = haftaninmenusudb(1, "index.jpg", "tarhana");
    var y4 = haftaninmenusudb(1, "index.jpg", "ezogelin");
    var y5 = haftaninmenusudb(1, "index.jpg", "ezogelin");
    var y6 = haftaninmenusudb(1, "index.jpg", "ezogelin");
    var y7 = haftaninmenusudb(1, "index.jpg", "ezogelin");
    var y8 = haftaninmenusudb(1, "index.jpg", "ezogelin");

    haftaninmenusuListesi.add(y1);
    haftaninmenusuListesi.add(y2);
    haftaninmenusuListesi.add(y3);
    haftaninmenusuListesi.add(y4);
    haftaninmenusuListesi.add(y5);
    haftaninmenusuListesi.add(y6);
    haftaninmenusuListesi.add(y7);
    haftaninmenusuListesi.add(y8);
    return haftaninmenusuListesi;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<haftaninmenusudb>>(
      future: menugetir(),
      //yemeklerin gelip gelmediğini anlamak için method oluştururuz
      builder: (context,i){
        if(i.hasData){
          //method liste döndürdüğü için
          var haftaninmenusuListesi = i.data;
          return GridView.builder(
            itemCount:haftaninmenusuListesi!.length ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2/ 2.5,
            ),
            itemBuilder: (context,index){
              var haftaninmenusu =haftaninmenusuListesi[index];
              return SizedBox(
                height: double.infinity,
                child:Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24,)
                  ),
                  child: GestureDetector(
                    onTap: (){
                     // Navigator.push(context,MaterialPageRoute(builder: (context) => corbalardetay(corba)));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/${haftaninmenusu.haftaninmenusudb_resimad}",height: 240,fit: BoxFit.cover,),
                        Text('${haftaninmenusu.haftaninmenusudb_menuadi}',style: TextStyle(
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


