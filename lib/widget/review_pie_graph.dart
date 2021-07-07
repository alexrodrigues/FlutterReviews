import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:poc_review_store/model/graph_info.dart';

class PieChartReview extends StatefulWidget {
  GraphInfo _graphInfo;

  PieChartReview(this._graphInfo);

  @override
  _PieChartReviewState createState() => _PieChartReviewState();
}

class _PieChartReviewState extends State<PieChartReview> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Número de Estrelas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: _buildPieChart(),
            ),
          )
        ],
      ),
    );
  }

  PieChart _buildPieChart() {
    return PieChart(
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
              color: const Color(0xffff0000).withOpacity(opacity),
              value: widget._graphInfo.oneStar.toDouble(),
              title: '1',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xff0293ee).withOpacity(opacity),
              value: widget._graphInfo.twoStar.toDouble(),
              title: '2',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xff845bef).withOpacity(opacity),
              value: widget._graphInfo.threeStar.toDouble(),
              title: '3',
              radius: 45,
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: widget._graphInfo.fourStar.toDouble(),
              title: '4',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );
          case 4:
            return PieChartSectionData(
              color: const Color(0xffffbf00).withOpacity(opacity),
              value: widget._graphInfo.fiveStar.toDouble(),
              title: '5',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );
          default:
            throw Error();
        }
      },
    );
  }
}
