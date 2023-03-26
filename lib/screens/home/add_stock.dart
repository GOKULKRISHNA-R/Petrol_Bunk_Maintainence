import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrol_bunk_maintainence/database/stock_bd.dart';

class AddStock extends StatelessWidget {
  const AddStock({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, Map<String, String>> mymap = {};
    mymap[0] = {"data":"Product Brand"} ;
    mymap[1] = {"data":"Count"} ;

    final _formKey = GlobalKey<FormState>();
    List<Widget> formList = [
      Row(
        children: [
          SizedBox(width: Get.width*0.3 ,child: const Text("Product Brand")),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                mymap[0]!["value"] = value.toString();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Value',
              ),
            ),
          )
        ],
      ),
      Row(
        children: [
          SizedBox(width: Get.width*0.3 ,child: const Text("Count")),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                mymap[1]!["value"] = value.toString();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Value',
              ),
            ),
          )
        ],
      ),
      ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              Map<String,String> formdata = {} ;
              mymap.forEach((key, value) {
                formdata[mymap[key]!["data"].toString().split(" ").join("_")] = mymap[key]!["value"].toString() ;
              });

              
              var response = StockDB().putInDB(formdata) ;
              log(response.toString());
            }
          },
          child: const Text("Submit"))
    ].obs;

    Widget rowAdd(int x) {
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                mymap[x]!["data"] = value.toString() ;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Data',
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                
                mymap[x]!["value"] = value.toString() ;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Value',
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              mymap[formList.length-1] = {} ;
              formList.insert(formList.length - 1, rowAdd(formList.length - 1));
            }),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: Obx(() => ListView(
                      children: formList,
                    )))));
  }
}
