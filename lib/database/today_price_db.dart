import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentNozzleReadingDB {
    final db = FirebaseFirestore.instance.collection("pump");

    getDataFromPump() async{
      
      var y = await db.doc("pump").get();
      return y.data();
    }

}