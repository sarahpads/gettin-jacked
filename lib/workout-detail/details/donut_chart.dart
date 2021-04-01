import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WorkoutChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          alignment: ChartAlignment.center,
          orientation: LegendItemOrientation.vertical,
          iconHeight: 15,
          iconWidth: 15
        ),
        series: <DoughnutSeries<SalesData, String>>[
          DoughnutSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Dec', 100),
              SalesData('Jan', 75),
              SalesData('Feb', 25),
              SalesData('March', 5)
            ],
            animationDuration: 0,
            innerRadius: '40%',
            legendIconType: LegendIconType.circle,
            xValueMapper: (SalesData data, _) => data.year,
            yValueMapper: (SalesData data, _) => data.sales
          )
        ]
      )
    );
  }
}

class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}

