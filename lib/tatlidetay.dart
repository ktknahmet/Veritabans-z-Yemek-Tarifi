import 'package:flutter/material.dart';
import 'package:yemek_tarifi/tatlilardb.dart';

class tatlidetay extends StatefulWidget  {
  tatlilardb tatlilarDB;

  tatlidetay(this.tatlilarDB);

  @override
  _tatlidetayState createState() => _tatlidetayState();
}

class _tatlidetayState extends State<tatlidetay> {
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
            : Text("${widget.tatlilarDB.tatlilar_tatliadi}"),
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
          Image.asset("images/${widget.tatlilarDB.tatlilar_resimad}",fit: BoxFit.fill),
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
                    Text("${widget.tatlilarDB.tatlilar_tatliadi}",style: TextStyle(fontSize: 35,color: Colors.red,),textAlign: TextAlign.left,),
                    Text("${widget.tatlilarDB.tatlilar_tatliyapilisi}",style: TextStyle(fontSize: 20,),),
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
