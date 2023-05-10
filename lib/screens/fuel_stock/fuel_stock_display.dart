import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:petrol_bunk_maintainence/database/current_fuel_stock_db.dart';

class FuelStockDisplay extends StatelessWidget {
  FuelStockDisplay({super.key});
  var x = {};
  var petrol;
  var diesel;
  var oil;
  CurrentFuelStockDB currentFuelStockDB = CurrentFuelStockDB();
  getFuelData() async {
    x = await currentFuelStockDB.getDataFromDB();
    petrol = x["petrol"].toString();
    diesel = x["diesel"].toString();
    oil = x["oil"].toString();
  }

  @override
  Widget build(BuildContext context) {
    getFuelData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 154, 45, 45),
          title: Text("Total fuel display"),
          centerTitle: true,
          shadowColor: Colors.black,
        ),
        body: SafeArea(
            child: ListView(children: [
          Container(
            padding: EdgeInsets.only(
                top: Get.height * 0.01, bottom: Get.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Stock of Fuels",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Balance Petrol :${petrol}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Balance Diesel : ${diesel}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Balance Oil : ${oil}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color.fromARGB(255, 154, 46, 46), // background (button) color
              foregroundColor: Colors.white, // foreground (text) color
            ),
            onPressed: () {
              // int petrolCost =
              _showAlertDialog(context);
            },
            child: const Text('Update'),
          ),
        ])));
  }
}

void _showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Add stock"),
    content: Container(
      color: Color.fromARGB(255, 234, 224, 223),
      height: Get.height * 0.4,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          // Text(
          //   "Total petrol sold :",
          //   textAlign: TextAlign.right,
          // ),
          TextField(
            // controller: calculatorController.todayOil,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Petrol',
                hintText: "Add petrol to the stock"),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          // Text(
          //   "Total diesel sold (in rupees):",
          //   textAlign: TextAlign.right,
          // ),
          TextField(
            // controller: calculatorController.todayOil,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'stock',
                hintText: "Add diesel to the stock"),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          // Text(
          //   "Total amount :",
          //   textAlign: TextAlign.right,
          // ),
          TextField(
            // controller: calculatorController.todayOil,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'oil',
                hintText: "Add oil to the stock"),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    ),
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Color.fromARGB(255, 227, 80, 80), // background (button) color
          foregroundColor: Colors.white, // foreground (text) color
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Update"),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Color.fromARGB(255, 227, 80, 80), // background (button) color
          foregroundColor: Colors.white, // foreground (text) color
        ),
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}





  // Container(
  //           padding: EdgeInsets.only(
  //               top: Get.height * 0.01, bottom: Get.height * 0.01),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 "Update products",
  //                 style: TextStyle(fontSize: 25),
  //               ),
  //             ],
  //           ),
  //         ),
  //         // Divider(
  //         //   color: Colors.grey,
  //         //   height: 1,
  //         //   thickness: 1,
  //         // ),
  //         SizedBox(
  //           height: Get.height * 0.05,
  //         ),
  //         TextField(
  //           // controller: calculatorController.todayDiesel,
  //           decoration: InputDecoration(
  //               isDense: true,
  //               contentPadding: EdgeInsets.symmetric(
  //                   horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
  //               counterText: 'Petrol',
  //               hintText: "Enter the amount of petrol added (in lit)"),
  //           keyboardType: TextInputType.number,
  //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //         ),
  //         SizedBox(
  //           height: Get.height * 0.04,
  //         ),
  //         TextField(
  //           // controller: calculatorController.todayDiesel,
  //           decoration: InputDecoration(
  //             isDense: true,
  //             contentPadding: EdgeInsets.symmetric(
  //                 horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
  //             counterText: 'Diesel',
  //             hintText: "Enter the amount of diesel added (in lit)",
  //           ),
  //           keyboardType: TextInputType.number,
  //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //         ),
  //         SizedBox(
  //           height: Get.height * 0.04,
  //         ),
  //         TextField(
  //           // controller: calculatorController.todayDiesel,
  //           decoration: InputDecoration(
  //               isDense: true,
  //               contentPadding: EdgeInsets.symmetric(
  //                   horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
  //               counterText: 'Oil',
  //               hintText: "Enter the amount of oil added (in lit)"),
  //           keyboardType: TextInputType.number,
  //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //         ),

  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor:
  //                 Color.fromARGB(255, 154, 46, 46), // background (button) color
  //             foregroundColor: Colors.white, // foreground (text) color
  //           ),
  //           onPressed: () {
  //             // int petrolCost =
  //           },
  //           child: const Text('Update'),
  //         ),