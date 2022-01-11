import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_mobile/controllers/second_controller.dart';
import 'package:suitmedia_mobile/models/user_model.dart';
import 'package:suitmedia_mobile/views/third/third_screen.dart';
import 'package:suitmedia_mobile/widgets/button.dart';

class SecondScreen extends StatefulWidget {
  static String routeName = '/second';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final SecondController _secondController = Get.find<SecondController>();

  bool isUserData = false;
  late Data? resultData;

  Widget titleText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        GetBuilder<SecondController>(
          init: SecondController(),
          builder: (_) => Text(
            '${_secondController.name}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget userData() {
    return Center(
      child: !isUserData
          ? const Text(
              "Selected User Name",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            )
          : Text(
              "${resultData!.firstName} ${resultData!.lastName}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
    );
  }

  Widget userButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: PrimaryButton(
        'Choose a User',
        onPressed: () async {
          var result = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThirdScreen()));

          setState(() {
            if (result != null) {
              resultData = result;
              isUserData = true;
            } else {
              isUserData = false;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14),
            titleText(),
            Expanded(
              child: Container(),
            ),
            userData(),
            Expanded(
              child: Container(),
            ),
            userButton()
          ],
        ),
      ),
    );
  }
}
