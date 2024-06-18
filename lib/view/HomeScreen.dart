import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:opinionchart/constants/colors.dart';
import 'package:opinionchart/view/Widgets/customRoundedButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        title: Text("Opinion Chart"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome to Opinion Chart App!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 129, 60, 194),
                fontSize: 22,
              ),
            ),
            SizedBox(height: 80),
            CustomButton(
              height: 52,
              width: MediaQuery.of(context).size.width - 100,
              color: AppColors.secondaryColor,
              text: "Show chart",
              isLoading: false,
              performTask: (p0) {
                Get.toNamed("/charts");
              },
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Hi, I'm Nishant. I'm thrilled to have you here! This app is a showcase of my skills and passion for creating innovative solutions. Explore the features, enjoy the experience, and feel free to reach out with any feedback.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 95, 89, 100),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
