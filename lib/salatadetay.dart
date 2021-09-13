import 'package:flutter/material.dart';
import 'package:yemek_tarifi/salatalardb.dart';

class salatadetay extends StatefulWidget  {
 late salatalardb salatalarDB;


 salatadetay(this.salatalarDB);

  @override
  _salatadetayState createState() => _salatadetayState();
}

class _salatadetayState extends State<salatadetay> {
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
            : Text("${widget.salatalarDB.salatalardb_salataadi}"),
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
          Image.asset("images/${widget.salatalarDB.salatalardb_resimadi}",fit: BoxFit.fill),
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
                    Text("${widget.salatalarDB.salatalardb_salataadi}",style: TextStyle(fontSize: 35,color: Colors.red,),textAlign: TextAlign.left,),
                    Text("${widget.salatalarDB.salatalardb_salatayapilisi}",style: TextStyle(fontSize: 20,),),
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
