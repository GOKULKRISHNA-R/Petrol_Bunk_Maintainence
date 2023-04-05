import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrol_bunk_maintainence/controllers/stock_db_controller.dart';
import 'package:petrol_bunk_maintainence/database/stock_bd.dart';
import '../../utils/components/stock_widget.dart';

class Stock extends StatelessWidget {
  Stock({super.key});

  var count = 0.obs;

  getCount() async {
    count.value = await StockDB().getCountOfStock();
    // log(count.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: Get.height * 0.01, bottom: Get.height * 0.01),
            child: Text(
              "List of products",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
              height: Get.height * 0.05,
              width: Get.width * 0.9,
              child: Obx(() =>
                  Text("Number of products = ${count.value.toString()}"))),
          SizedBox(
            height: Get.height * 0.8,
            width: Get.width,
            child: GetBuilder<StockDBController>(
                init: StockDBController(),
                builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return DropdownContainer(s: controller.data[i]);
                      });
                }),
          ),
        ],
      ),
    ));
  }
}
