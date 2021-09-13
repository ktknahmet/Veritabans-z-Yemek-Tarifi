import 'package:flutter/material.dart';
import 'package:yemek_tarifi/anayemek.dart';
import 'package:yemek_tarifi/corbalar.dart';
import 'package:yemek_tarifi/haftaninmenusu.dart';
import 'package:yemek_tarifi/salatalar.dart';
import 'package:yemek_tarifi/tatlilar.dart';
import 'package:yemek_tarifi/tumyemekler.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool aramavarmi = false;
bool fabcheck = false;
var sayfalar = [tumyemekler(),salatalar(),corbalar(),anayemek(),tatlilar(),haftaninmenusu()];
int secilensayfa =0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: aramavarmi ?
            TextField(
                decoration: InputDecoration(
                  hintText: "Aramak İçin Birşeyler Yazın"),
                  onChanged: (aramasonucu){
                  print("arama sonucu : $aramasonucu");
            },
                )
            : Text("Enfes Yemek Tarifleri"),
        actions: [
          aramavarmi ?  IconButton(
            icon: Icon(Icons.search_off),
            onPressed: (){
              setState(() {
                aramavarmi = false;
              });
            },
          )
       :  IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
               setState(() {
                 aramavarmi = true;
               });
            },
          )

        ],
             ),
      body: sayfalar[secilensayfa],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Leziz Yemek Tarifleri",style: TextStyle(fontSize: 20,color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            ),
            ListTile(
              title:Text("Tüm Yemekler") ,
              onTap: (){
                setState(() {
                  secilensayfa=0;
                  Navigator.pop(context);
                });

              },
            ),
            ListTile(
              title:Text("Salatalar") ,
              onTap: (){
                setState(() {
                  secilensayfa=1;
                  Navigator.pop(context);
                });

              },
            ),
            ListTile(
              title:Text("Çorbalar") ,
              onTap: (){
                setState(() {
                  secilensayfa=2;
                  Navigator.pop(context);
                });

              },
            ),
            ListTile(
              title:Text("Ana Yemek") ,
              onTap: (){
                setState(() {
                  secilensayfa=3;
                  Navigator.pop(context);
                });

              },
            ),
            ListTile(
              title:Text("Tatlılar") ,
              onTap: (){
                setState(() {
                  secilensayfa=4;
                  Navigator.pop(context);
                });

              },
            ),
            ListTile(
              title:Text("Haftanın Menüsü") ,
              onTap: (){
                setState(() {
                  secilensayfa=5;
                  Navigator.pop(context);
                });

              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: (){
            setState(() {

            });
          },

        ),
      );

  }
}
