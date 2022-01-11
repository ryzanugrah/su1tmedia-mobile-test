import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile/constants.dart';
import 'package:suitmedia_mobile/controllers/first_controller.dart';
import 'package:suitmedia_mobile/widgets/button.dart';

class FirstScreen extends StatelessWidget {
  static String routeName = "/first";
  final FirstController _firstController = Get.put(FirstController());

  Widget nameForm() {
    return TextFormField(
      controller: _firstController.nameController,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: 'Name',
        hintStyle: TextStyle(color: Color(0xFF6867775C)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget palindromeForm() {
    return TextFormField(
      controller: _firstController.palindromeController,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: 'Palindrome',
        hintStyle: TextStyle(color: Color(0xFF6867775C)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget checkButton() {
    return PrimaryButton(
      'CHECK',
      onPressed: () => _firstController.checkPalindrome(),
    );
  }

  Widget nextButton() {
    return PrimaryButton(
      'NEXT',
      onPressed: () => _firstController.nextScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage('assets/images/btn_add_photo.png'),
                    height: MediaQuery.of(context).size.height/7),
                SizedBox(
                  height: 50,
                ),
                nameForm(),
                SizedBox(
                  height: 20,
                ),
                palindromeForm(),
                SizedBox(
                  height: 40,
                ),
                checkButton(),
                SizedBox(
                  height: 15,
                ),
                nextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
