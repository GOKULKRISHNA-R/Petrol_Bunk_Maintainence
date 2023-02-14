import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_screen extends StatelessWidget {
  const Login_screen({super.key});
//042061
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003a68),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/loginImg.jpg'),
                width: Get.width * 1,
                height: Get.height * 0.4,
                fit: BoxFit.cover,
              ),
              Form(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                            color: Colors.greenAccent,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Color(0xFF749776)),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color(0xFF749776)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF69F0AE)),
                          )),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.fingerprint,
                            color: Colors.greenAccent,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Color(0xFF749776)),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color(0xFF749776)),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.greenAccent,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w400,
                                fontSize: Get.height * 0.03)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF00233F))),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
