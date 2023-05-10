import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class FuelStockDisplay extends StatelessWidget {
  FuelStockDisplay({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Balance Petrol",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Balance Diesel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Balance Oil",
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
          Container(
            padding: EdgeInsets.only(
                top: Get.height * 0.01, bottom: Get.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Update products",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          // Divider(
          //   color: Colors.grey,
          //   height: 1,
          //   thickness: 1,
          // ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          TextField(
            // controller: calculatorController.todayDiesel,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
                counterText: 'Petrol',
                hintText: "Enter the amount of petrol added (in lit)"),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          TextField(
            // controller: calculatorController.todayDiesel,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
              counterText: 'Diesel',
              hintText: "Enter the amount of diesel added (in lit)",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          TextField(
            // controller: calculatorController.todayDiesel,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
                counterText: 'Oil',
                hintText: "Enter the amount of oil added (in lit)"),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
