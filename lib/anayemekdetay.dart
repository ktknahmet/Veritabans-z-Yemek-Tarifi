import 'package:flutter/material.dart';
import 'package:yemek_tarifi/anayemekdb.dart';

class anayemekdetay extends StatefulWidget  {
 late anayemekdb anayemekDB;


 anayemekdetay(this.anayemekDB);

  @override
  _anayemekdetayState createState() => _anayemekdetayState();
}

class _anayemekdetayState extends State<anayemekdetay> {
  bool aramavarmi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: aramavarmi ?
        TextField(
          decoration: InputDecoration(
              hintText: "Aramak İçin Birşeyler Yazın"),
          onChanged: (aramasonucu){
            print("arama sonucu : $aramasonucu");
          },
        )
            : Text("${widget.anayemekDB.anayemekdb_anayemekadi}"),
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
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset("images/${widget.anayemekDB.anayemekdb_resimad}",fit: BoxFit.fill),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("${widget.anayemekDB.anayemekdb_anayemekadi}",style: TextStyle(fontSize: 35,color: Colors.red,),textAlign: TextAlign.left,),
                    Text("${widget.anayemekDB.anayemekdb_anayemekyapilisi}",style: TextStyle(fontSize: 20,),),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );

  }
}
