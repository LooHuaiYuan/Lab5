import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatelessWidget {

  double width, height, value;
  String parameter, unit;

  Gauge({super.key, required this.width, required this.height, required this.value, required this.parameter, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width*0.4,
        height: height*0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
            Color.fromRGBO(254, 255, 254, 1)),
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4000,
          title: GaugeTitle(
            text: parameter,
            textStyle: TextStyle(
                fontSize: width*0.048,
                color: Colors.grey[700]
            ),
          ),
          axes: [
            RadialAxis(
              startAngle: 180,
              endAngle: 0,
              interval: 50,
              axisLineStyle: AxisLineStyle(
                  thickness: 0.3,
                  thicknessUnit: GaugeSizeUnit.factor,
                  color: Colors.grey[300]
              ),
              showLabels: false,
              pointers: [
                MarkerPointer(
                  value: 30,
                  enableDragging: true,
                  enableAnimation: true,
                  markerWidth: 20,
                  markerHeight: 10,
                  markerOffset: -15,
                  color: Colors.grey[300],
                ),
                RangePointer(
                  value: value,
                  color: Colors.green,
                ),
              ],
              annotations: [
                GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.5,
                  widget: Text.rich(
                    TextSpan(
                      text: value.toString(),
                      style: TextStyle(
                          fontSize: width*0.058,
                          fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: unit,
                          style: TextStyle(
                            fontSize: width*0.036,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
