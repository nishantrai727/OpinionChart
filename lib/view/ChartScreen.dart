import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:opinionchart/constants/colors.dart';
import 'package:opinionchart/service/apiService.dart';
import 'package:opinionchart/view/Widgets/customLineChart.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  ApiService _apiService = ApiService();
  List<dynamic> chartData = [];
  bool isLoading = true;
  late Timer _timer;
  bool refresher = true;

  String price = "";

  void scheduler() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
      await fetchChartData();
      print("a");
    });
  }

  Future<void> fetchChartData() async {
    try {
      DateTime _currentTime = DateTime.now();
      var body = {"currency": "USD", "code": "BTC", "meta": true};

      final response = await _apiService.postData(body, "");

      setState(() {
        chartData.add({
          "time": _currentTime.toIso8601String(),
          "price": response['rate'].toString() ?? "0.0",
        });
        isLoading = false;
        price = (1.0 +
                ((((double.parse(response['rate'].toString()) % 100) == 0.0
                        ? 1.0
                        : (double.parse(response['rate'].toString()))) %
                    100)))
            .toString();
        refresher = !refresher;
        if (chartData.length > 99) {
          chartData.removeAt(0);
        }
      });

      // print({
      //   "time": _currentTime.toIso8601String(),
      //   "price": response['rate'].toString() ?? "0.0",
      // }.toString());
    } catch (err) {
      debugPrint(err.toString());
      // throw (err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduler();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        title: Text("Live Chart"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Text("Price : ${price}"),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  child: refresher
                      ? LineChartCustom(chartData: chartData)
                      : Container(
                          child: LineChartCustom(chartData: chartData),
                        ),
                ),
              ],
            ),
            if (isLoading)
              Center(
                child: Container(
                  // height: 100,
                  // width: 100,
                  decoration: BoxDecoration(
                    // color: AppColors.secondaryColorInputFields,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.contrastColor,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
