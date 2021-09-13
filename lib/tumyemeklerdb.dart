import 'package:yemek_tarifi/anayemekdb.dart';
import 'package:yemek_tarifi/corbalardb.dart';
import 'package:yemek_tarifi/haftaninmenusudb.dart';
import 'package:yemek_tarifi/salatalardb.dart';
import 'package:yemek_tarifi/tatlilardb.dart';

class tumyemeklerdb {
   tatlilardb tatli;
   salatalardb salatalar;
   corbalardb corbalar;
   anayemekdb anayemek;

   tumyemeklerdb( this.tatli, this.salatalar, this.corbalar, this.anayemek);
}