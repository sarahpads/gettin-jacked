import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        onAxisLabelRender: (args) {
          if (args.axisName != 'datetime') {
            return;
          }

          DateTime date = DateTime.fromMicrosecondsSinceEpoch(args.value.toInt());

          args.text = '${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}';
        },
        primaryXAxis: NumericAxis(
          name: 'datetime'
        ),
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom
        ),
        series: <ChartSeries>[
          ExerciseSeries(
            name: 'Chin up',
            dataSource: <RepData>[
              RepData('chin-up', DateTime(2021, 03, 24, 13, 30), 4, 4),
              RepData('chin-up', DateTime(2021, 03, 24, 13, 40), 3, 4),
              RepData('chin-up', DateTime(2021, 03, 24, 13, 50), 3, 4),
            ],
          ),
          ExerciseSeries(
            name: 'Pull up',
            dataSource: <RepData>[
              RepData('pull-up', DateTime(2021, 03, 24, 13, 35), 3, 3),
              RepData('pull-up', DateTime(2021, 03, 24, 13, 45), 1, 3),
            ],
          ),
          ExerciseSeries(
            name: 'Full push up',
            dataSource: <RepData>[
              RepData('full-push-up', DateTime(2021, 03, 24, 13, 35), 5, 5),
              RepData('full-push-up', DateTime(2021, 03, 24, 13, 55), 3, 5),
            ],
          ),
          ExerciseSeries(
            name: 'Half push up',
            dataSource: <RepData>[
              RepData('half-push-up', DateTime(2021, 03, 24, 13, 34), 10, 10),
              RepData('half-push-up', DateTime(2021, 03, 24, 13, 56), 6, 10)
            ],
          )
        ],
      )
    );
  }
}

class ExerciseSeries extends LineSeries<RepData, int> {
  ExerciseSeries({List<RepData> dataSource, String name})
    : super(
      dataSource: dataSource,
      name: name,
      animationDuration: 0,
      xValueMapper: (RepData data, _) => data.time.millisecondsSinceEpoch,
      yValueMapper: (RepData data, _) => data.reps / data.max,
      markerSettings: MarkerSettings(isVisible: true)
    );
}

class RepData {
  final String exercise;
  final DateTime time;
  final int reps;
  final int max;

  RepData(this.exercise, this.time, this.reps, this.max);
}