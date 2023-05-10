import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:petrol_bunk_maintainence/controllers/calculator_controller.dart';
import 'package:petrol_bunk_maintainence/controllers/fuel_stock_controller.dart';
import 'package:petrol_bunk_maintainence/database/current_fuel_stock_db.dart';

class FuelStockDisplay extends StatelessWidget {
  FuelStockDisplay({super.key});

   Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  var x = {};

  CurrentFuelStockDB currentFuelStockDB = CurrentFuelStockDB();
  var fuelStockController = Get.put(FuelStockController());

  getFuelData() async {
    x = await currentFuelStockDB.getDataFromDB();
    fuelStockController.cDiesel.text = x['diesel'].toString() ;
    fuelStockController.cPetrol.text = x['petrol'].toString() ;
    fuelStockController.cOil.text = x['oil'].toString() ;
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
          actions: [
            IconButton(
        onPressed: _signOut,
        icon: const Icon(Icons.logout),
      ),
          ],
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
            child: Column(children: [
              Container(
              padding: EdgeInsets.all(Get.width * 0.08),
            
              child: Column(
                children: [
                  TextField(
                    controller: fuelStockController.cPetrol,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'petrol balance',
                        // hintText: "Enter the todays petrol balance"
                        ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  TextField(
                    controller: fuelStockController.cDiesel,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: ' Diesel balance',
                        // hintText: "Enter the todays diesel balance"
                        ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  TextField(
                    controller: fuelStockController.cOil,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'oil balance',
                        // hintText: "Enter the todays oil balance"
                        ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
                ],)
          
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
            },
            child: const Text('Update'),
          ),
        ])));
  }
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