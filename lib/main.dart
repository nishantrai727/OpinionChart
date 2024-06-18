import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:opinionchart/view/ChartScreen.dart';
// import 'package:opinionchart/view/chartsScreen.dart';
import 'package:opinionchart/view/HomeScreen.dart';

void main() {
  //hide the status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opinion Chart',
      initialRoute: "/",
      home: HomeScreen(),
      getPages: [
        GetPage(
          name: "/",
          page: () => HomeScreen(),
        ),
        GetPage(
          name: "/charts",
          page: () => ChartScreen(),
        )
      ],
    );
  }
}
