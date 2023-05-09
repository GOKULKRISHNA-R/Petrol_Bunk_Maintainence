import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petrol_bunk_maintainence/controllers/calculator_controller.dart';
import 'package:petrol_bunk_maintainence/features/authentication/models/model_dialouge.dart';
import 'package:petrol_bunk_maintainence/screens/calculator/text_recognisation.dart';
import 'package:petrol_bunk_maintainence/utils/components/image_cropper_page.dart';
import 'package:petrol_bunk_maintainence/utils/components/image_picker_class.dart';

import '../../database/current_fuel_stock_db.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});

  CurrentFuelStockDB currentFuelStockDB = CurrentFuelStockDB();
  var calculatorController = Get.put(CalculatorController());
  var x = {} ;

  getDataFromAPI() async{
    x = await currentFuelStockDB.getDataFromDB() ;
    // log(x.toString());
    calculatorController.todayDiesel.text = x["diesel"].toString() ;
    calculatorController.todayPetrol.text = x["petrol"].toString() ;
    calculatorController.todayOil.text = x["oil"].toString() ;
    
  }

  @override
  Widget build(BuildContext context) {
     getDataFromAPI();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        height: Get.height * 0.95,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amount Calculator",
                  style: TextStyle(
                    fontSize: Get.height * 0.04,
                    color: Color.fromARGB(255, 81, 31, 90),
                    letterSpacing: 4,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Petrol : "),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.2,
                    child: TextFormField(controller: calculatorController.todayPetrol,)),
                Text("Diesel : "),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.2,
                    child: TextFormField(controller: calculatorController.todayDiesel)),
                Text("Oil : "),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.2,
                    child: TextFormField(controller: calculatorController.todayOil)),
              ],
            ),
            Text("PUMP 1"),
            TextField(
              controller: calculatorController.Nozzle1Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 1',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: calculatorController.Nozzle2Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 2',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: calculatorController.Nozzle3Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 3',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: calculatorController.Nozzle4Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 4',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            Text("PUMP 2"),
            TextField(
              controller: calculatorController.Nozzle5Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 1',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: calculatorController.Nozzle6Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 2',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              controller: calculatorController.Nozzle7Controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
                counterText: 'Nozzle 3',
              ),
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
                  hintText: ""),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: Get.height * 0.02,
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
                backgroundColor: Colors.black, // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {
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
