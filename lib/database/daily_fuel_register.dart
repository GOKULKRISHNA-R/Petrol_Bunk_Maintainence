import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DailyFuelRegsiter {
    final db = FirebaseFirestore.instance.collection("daily_fuel_register");

    getFuelFuelDB() async{
      var x = await db.doc("10-5-23").get();
      return x.data();
    }
    updateDailyFuelRegister(int diesel_amount, int diesel_sold_in_lit, int grand_total , int oil_sold_amt,int oil_sold_in_lit,int petrol_sold_amt,int petrol_sold_in_lit ) async {
    await db.doc("10-5-23").set({
     "diesel_sold_amt": diesel_amount,
     "diesel_sold_in_lit":diesel_sold_in_lit,
     "grand_total":grand_total,
     "oil_sold_amt":oil_sold_amt,
     "oil_sold_in_lit":oil_sold_in_lit,
     "petrol_sold_amt":petrol_sold_amt,
     "petrol_sold_in_lit":petrol_sold_in_lit
    });
  }
}