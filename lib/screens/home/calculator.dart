import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petrol_bunk_maintainence/controllers/calculator_controller.dart';
import 'package:petrol_bunk_maintainence/database/today_price_db.dart';

import '../../database/current_fuel_stock_db.dart';
import '../../database/current_nozzle_reading_db.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});

  TodayPriceDB todayPriceDB = TodayPriceDB();
  CurrentNozzleReadingDB currentNozzleReadingDB = CurrentNozzleReadingDB();
  var calculatorController = Get.put(CalculatorController());
  var x = {};
  var y = {};

  getDataFromAPI() async {
    x = await todayPriceDB.getDataFromDB();
    y = await currentNozzleReadingDB.getDataFromPump();
    // log(x.toString());
    calculatorController.todayDiesel.text = x["diesel"].toString();
    calculatorController.todayPetrol.text = x["petrol"].toString();
    calculatorController.todayOil.text = x["oil"].toString();
    calculatorController.Nozzle1Controller.text = y["nozzle1"].toString();
    calculatorController.Nozzle2Controller.text = y["nozzle2"].toString();
    calculatorController.Nozzle3Controller.text = y["nozzle3"].toString();
    calculatorController.Nozzle4Controller.text = y["nozzle4"].toString();
    calculatorController.Nozzle5Controller.text = y["nozzle5"].toString();
    calculatorController.Nozzle6Controller.text = y["nozzle6"].toString();
    calculatorController.Nozzle7Controller.text = y["nozzle7"].toString();
    calculatorController.Nozzle8Controller.text = y["nozzle8"].toString();
    calculatorController.oil.text = y["oil"].toString();
  }

  @override
  Widget build(BuildContext context) {
    getDataFromAPI();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 154, 45, 45),
        title: Text("Amount Calculator"),
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromARGB(255, 244, 231, 247),
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        height: Get.height * 0.95,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "Amount Calculator",
                //   style: TextStyle(
                //     fontSize: Get.height * 0.04,
                //     color: Color.fromARGB(255, 81, 31, 90),
                //     letterSpacing: 4,
                //   ),
                // ),
                SizedBox(
                  width: Get.width * 0.93,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 227, 80, 80), // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                    ),
                    onPressed: () {
                      // int petrolCost =
                    },
                    child: const Text("Today's fuel price"),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(Get.width * 0.08),
              // decoration: BoxDecoration(
              //   border: Border.all(width: 5, color: Colors.blueGrey),
              // ),
              child: Column(
                children: [
                  TextField(
                    controller: calculatorController.todayPetrol,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'petrol rate',
                        hintText: "Enter the todays petrol rate"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  TextField(
                    controller: calculatorController.todayDiesel,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: ' Diesel rate',
                        hintText: "Enter the todays diesel rate"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  TextField(
                    controller: calculatorController.todayOil,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'oil rate',
                        hintText: "Enter the todays oil rate"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            // Row(
            //   children: [
            //     Text("Petrol : "),
            //     Container(
            //         height: Get.height * 0.1,
            //         width: Get.width * 0.2,
            //         child: TextFormField(controller: calculatorController.todayPetrol,)),
            //     Text("Diesel : "),
            //     Container(
            //         height: Get.height * 0.1,
            //         width: Get.width * 0.2,
            //         child: TextFormField(controller: calculatorController.todayDiesel)),
            //     Text("Oil : "),
            //     Container(
            //         height: Get.height * 0.1,
            //         width: Get.width * 0.2,
            //         child: TextFormField(controller: calculatorController.todayOil)),
            //   ],
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 227, 80, 80), // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {
                // int petrolCost =
              },
              child: const Text('Pump 1 Readings'),
            ),
            Container(
              padding: EdgeInsets.all(Get.width * 0.08),
              child: Column(
                children: [
                  TextField(
                    controller: calculatorController.Nozzle1Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 1',
                        hintText: "Enter the nozzle1 number (diesel)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: calculatorController.Nozzle2Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 2',
                        hintText: "Enter the nozzle2 number (petrol)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: calculatorController.Nozzle3Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 3',
                        hintText: "Enter the nozzle3 number (diesel)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: calculatorController.Nozzle4Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 4',
                        hintText: "Enter the nozzle4 number (petrol)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 227, 80, 80), // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {
                // int petrolCost =
              },
              child: const Text('Pump 2 Readings'),
            ),
            Container(
              padding: EdgeInsets.all(Get.width * 0.08),
              child: Column(
                children: [
                  TextField(
                    controller: calculatorController.Nozzle5Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 1',
                        hintText: "Enter the nozzle1 number (diesel)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: calculatorController.Nozzle6Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 2',
                        hintText: "Enter the nozzle2 number (petrol)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: calculatorController.Nozzle7Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 3',
                        hintText: "Enter the nozzle3 number (diesel)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  TextField(
                    controller: calculatorController.Nozzle8Controller,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        counterText: 'Nozzle 4',
                        hintText: "Enter the nozzle4 number (petrol)"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                ],
              ),
            ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.black, // background (button) color
            //     foregroundColor: Colors.white, // foreground (text) color
            //   ),
            //   onPressed: () {
            //     imagePickerModal(context, onCameraTap: () {
            //       pickImage(source: ImageSource.camera).then((value) {
            //         if (value != '') {
            //           imageCropperView(value, context).then((value) {
            //             if (value != '') {
            //               Navigator.push(
            //                 context,
            //                 CupertinoPageRoute(
            //                   builder: (_) => RecognizePage(
            //                     path: value,
            //                   ),
            //                 ),
            //               );
            //             }
            //           });
            //         }
            //       });
            //     }, onGalleryTap: () {
            //       pickImage(source: ImageSource.gallery).then((value) {
            //         if (value != '') {
            //           imageCropperView(value, context).then((value) {
            //             if (value != '') {
            //               Navigator.push(
            //                 context,
            //                 CupertinoPageRoute(
            //                   builder: (_) => RecognizePage(
            //                     path: value,
            //                   ),
            //                 ),
            //               );
            //             }
            //           });
            //         }
            //       });
            //     });
            //   },
            //   child: const Text('Camera'),
            // )
            // ,
            SizedBox(
              height: Get.height * 0.04,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 227, 80, 80), // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {
                // int petrolCost =
              },
              child: const Text('Oil Reading'),
            ),
            Container(
              padding: EdgeInsets.all(Get.width * 0.08),
              child: Column(children: [
                TextField(
                  controller: calculatorController.oil,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.04,
                          vertical: Get.height * 0.01),
                      counterText: 'Oil',
                      hintText: "Enter the oil nozzle number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ]),
            ),

            SizedBox(
              height: Get.height * 0.02,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {
                _showAlertDialog(context);
                int diesel =
                    int.parse(calculatorController.Nozzle1Controller.text) +
                        int.parse(calculatorController.Nozzle3Controller.text) +
                        int.parse(calculatorController.Nozzle5Controller.text) +
                        int.parse(calculatorController.Nozzle7Controller.text);
                int petrol =
                    int.parse(calculatorController.Nozzle2Controller.text) +
                        int.parse(calculatorController.Nozzle4Controller.text) +
                        int.parse(calculatorController.Nozzle6Controller.text) +
                        int.parse(calculatorController.Nozzle8Controller.text);

                // int petrolCost =
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Calculated Amount"),
    content: Container(
      color: Color.fromARGB(255, 234, 224, 223),
      height: Get.height * 0.4,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          Text(
            "Total petrol sold :",
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Total diesel sold :",
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Total oil sold :",
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Total petrol sold(in rupees) :",
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Total diesel sold(in rupees) :",
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Total diesel sold (in rupees):",
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Total amount :",
            textAlign: TextAlign.right,
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
          Navigator.pop(context);
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
