import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_tarifi/corbalardb.dart';


class corbalardetay extends StatefulWidget  {

  late corbalardb corbalarDB;
  corbalardetay(this.corbalarDB);

  @override
  _corbalardetayState createState() => _corbalardetayState();
}

class _corbalardetayState extends State<corbalardetay> {
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
            : Text("${widget.corbalarDB.corbalardb_corbaadi}"),
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
           Image.asset("images/${widget.corbalarDB.corbalardb_resimad}",fit: BoxFit.fill),
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
               child: Column(
                 children: [
                   Text("${widget.corbalarDB.corbalardb_corbaadi}",style: TextStyle(fontSize: 35,color: Colors.red,),textAlign: TextAlign.left,),
                   Text("${widget.corbalarDB.corbalardb_corbayapilisi}",style: TextStyle(fontSize: 20,),),
                 ],
               ),
             ),
           ),

         ],
       ),
        );


  }
}
