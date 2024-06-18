import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineChartCustom extends StatefulWidget {
  List<dynamic> chartData;

  LineChartCustom({required this.chartData});

  @override
  State<LineChartCustom> createState() => _LineChartCustomState();
}

class _LineChartCustomState extends State<LineChartCustom> {
  bool showAvg = false;

  List<FlSpot> pointersOnGraph = [];
  List<String> dates = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < widget.chartData.length; i++) {
      DateTime date = DateTime.parse(widget.chartData[i]['time']);
      String formattedDate = DateFormat("HH:MM").format(date);
      dates.add(formattedDate);
      double tt = 1.0 +
          ((((double.parse(widget.chartData[i]['price'].toString()) % 100) ==
                      0.0
                  ? 1.0
                  : (double.parse(widget.chartData[i]['price'].toString()))) %
              100));
      pointersOnGraph.add(FlSpot(i + 1, tt));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(right: 8),
      child: LineChart(
        mainData(),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF1D1D1D),
      fontSize: 10,
      fontFamily: 'PublicSans-400',
    );

    List<String> titles = ["", ...dates];
    Widget text;
    int index = value.toInt();
    if (index < titles.length) {
      text = Text(titles[index], style: style, textAlign: TextAlign.center);
    } else {
      text = Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF1D1D1D),
      fontSize: 10,
      fontFamily: 'PublicSans-400',
    );
    Widget text;
    int index = value.toInt();
    List<String> titles =
        List<String>.generate(101, (index) => index.toString());
    ;

    if (index < titles.length) {
      text = Text(titles[index], style: style, textAlign: TextAlign.center);
    } else {
      text = Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(show: false),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        drawHorizontalLine: true,
        checkToShowHorizontalLine: (value) {
          return showAllGrids(value);
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 0.4,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          // axisNameWidget: Text("Time"),
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text("Time"),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 10,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          axisNameWidget: Text("Price"),
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      minX: 0,
      maxX: 100,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: [...pointersOnGraph],
          isCurved: true,

          color: Colors.yellow,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
          barWidth: 3,

          curveSmoothness: 0.01,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              radius: 2,
              color: Colors.purple,
              strokeWidth: 0,
              strokeColor: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}
