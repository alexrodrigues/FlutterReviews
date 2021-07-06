import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartReview extends StatefulWidget {
  @override
  _PieChartReviewState createState() => _PieChartReviewState();
}

class _PieChartReviewState extends State<PieChartReview> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
            setState(() {
              final desiredTouch =
                  pieTouchResponse.touchInput is! PointerExitEvent &&
                      pieTouchResponse.touchInput is! PointerUpEvent;
              if (desiredTouch && pieTouchResponse.touchedSection != null) {
                _touchedIndex =
                    pieTouchResponse.touchedSection.touchedSectionIndex;
              } else {
                _touchedIndex = -1;
              }
            });
          }),
          startDegreeOffset: 180,
          borderData: FlBorderData(show: false),
          sectionsSpace: 1,
          centerSpaceRadius: 10,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      5,
      (i) {
        final isTouched = i == _touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee).withOpacity(opacity),
              value: 25,
              title: '1',
              radius: 45,
              // titleStyle: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xfff8b250).withOpacity(opacity),
              value: 25,
              title: '2',
              radius: 45,
              // titleStyle: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xff845bef).withOpacity(opacity),
              value: 25,
              title: '3',
              radius: 45,
              // titleStyle: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '4',
              radius: 45,
              // titleStyle: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          case 4:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '5',
              radius: 45,
              // titleStyle: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          default:
            throw Error();
        }
      },
    );
  }
}
