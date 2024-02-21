import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone_with_getx/controller/authentication_controller.dart';
import 'package:google_drive_clone_with_getx/utils.dart';

class LoginScreen extends StatelessWidget {
  AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.purpleAccent])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewInsets.top + 100),
              child: const Image(
                  height: 200,
                  width: 200,
                  image: AssetImage("./assets/folder.png")),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  top: 30, bottom: 35, right: 30, left: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.white, spreadRadius: 5)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Simplify Your",
                      style: textStyle(
                          25, const Color(0xff635c9b), FontWeight.w700),
                    ),
                    Text(
                      "filing system",
                      style: textStyle(
                          25, const Color(0xff635c9b), FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Keep your files",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    Text(
                      "organized more easily",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => _authController.login(),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepOrangeAccent.withOpacity(0.8)),
                        child: Center(
                          child: Text(
                            "Let's go",
                            style: textStyle(23, Colors.white, FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
