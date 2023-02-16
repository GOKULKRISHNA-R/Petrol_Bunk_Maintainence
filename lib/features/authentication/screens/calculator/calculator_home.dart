import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: Get.height * 0.06),
        height: Get.height * 0.5,
        width: Get.width * 1,
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calculator",
              style: TextStyle(fontSize: 45),
            ),
            Text("Sp1:  --------"),
            Text("Sp1:  --------"),
          ],
        ),
      ),
    );
  }
}
