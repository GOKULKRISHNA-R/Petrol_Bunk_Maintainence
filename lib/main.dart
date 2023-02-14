import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrol_bunk_maintainence/features/authentication/screens/login/login.dart';
import 'package:petrol_bunk_maintainence/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petrol Bunk Maintainence',
      theme: DIAppTheme.lightTheme,
      darkTheme: DIAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Petrol Bunk Maintainence'),
      ),
      body: TextButton(
          child: Text("data"),
          onPressed: () async {
            Get.to(() => Login_screen());
          }),
    );
  }
}
