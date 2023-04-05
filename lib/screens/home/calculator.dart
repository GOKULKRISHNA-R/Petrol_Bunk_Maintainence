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

class Calculator extends StatelessWidget {
  Calculator({super.key});
  var calculatorController = Get.put(CalculatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: Get.height * 0.09),
            child: Text(
              "Amount Calculator",
              style: TextStyle(
                fontSize: Get.height * 0.04,
                color: Color.fromARGB(255, 81, 31, 90),
                letterSpacing: 4,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.8,
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.08, vertical: Get.height * 0),
            child: ListView(
              children: [
                TextField(
                  controller: calculatorController.Nozzle1Controller,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01),
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
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01),
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
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01),
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
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01),
                    counterText: 'Nozzle 4',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextField(
                  controller: calculatorController.Nozzle5Controller,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01),
                    counterText: 'Nozzle 5',
                  ),
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
                    counterText: 'Nozzle 6',
                  ),
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
                    counterText: 'Nozzle 7',
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
                      counterText: 'Nozzle 8',
                      hintText: ""),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // background (button) color
                    foregroundColor: Colors.white, // foreground (text) color
                  ),
                  onPressed: () => print('pressed'),
                  child: const Text('Calculate'),
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
                    imagePickerModal(context, onCameraTap: () {
                      pickImage(source: ImageSource.camera).then((value) {
                        if (value != '') {
                          imageCropperView(value, context).then((value) {
                            if (value != '') {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => RecognizePage(
                                    path: value,
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      });
                    }, onGalleryTap: () {
                      pickImage(source: ImageSource.gallery).then((value) {
                        if (value != '') {
                          imageCropperView(value, context).then((value) {
                            if (value != '') {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => RecognizePage(
                                    path: value,
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      });
                    });
                  },
                  child: const Text('Camera'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
