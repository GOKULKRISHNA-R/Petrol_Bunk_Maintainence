import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentFuelStockDB {
    final db = FirebaseFirestore.instance.collection("today_price");

    getDataFromDB() async{
      var x = await db.doc("VFn16suseaxD613OOg18").get();
      return x.data();
    }

}