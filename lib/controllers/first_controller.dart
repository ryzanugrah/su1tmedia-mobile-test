import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suitmedia_mobile/controllers/second_controller.dart';

class FirstController extends GetxController {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? palindromeController = TextEditingController();

  @override
  void onInit() {
    nameController = TextEditingController();
    palindromeController = TextEditingController();
    super.onInit();
  }

  bool _isPalindrome(String string) {
    string = string.replaceAll(" ", "");
    String reverse = string.split('').reversed.join('');
    if (string == reverse) {
      return true;
    }
    return false;
  }

  void showToastEmptyName() {
    Fluttertoast.showToast(msg: "Fill the Name field!");
  }

  void showToastEmptyPalindrome() {
    Fluttertoast.showToast(msg: "Fill the Palindrome field!");
  }

  void showToastIsPalindrome() {
    Fluttertoast.showToast(msg: "isPalindrome");
  }

  void showToastNotPalindrome() {
    Fluttertoast.showToast(msg: "notPalindrome");
  }

  void checkPalindrome() {
    if (_isPalindrome(palindromeController!.text.toLowerCase()) &&
        palindromeController!.text.length == 0) {
      showToastEmptyPalindrome();
    } else if (_isPalindrome(palindromeController!.text.toLowerCase()) &&
        palindromeController!.text.length != 0) {
      showToastIsPalindrome();
    } else {
      showToastNotPalindrome();
    }
  }

  void nextScreen() {
    final SecondController _secondController = Get.put(SecondController());
    if (nameController!.text.length == 0) {
      showToastEmptyName();
    } else {
      Get.toNamed('/second');
      _secondController.getName(nameController!.text);
    }
  }

  @override
  void dispose() {
    nameController?.dispose();
    palindromeController?.dispose();
    super.dispose();
  }
}
