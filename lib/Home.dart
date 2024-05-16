import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatelessWidget {
  int factoryNumber;

  Home({super.key, required this.factoryNumber});
//data for home page
  List<double> steamPressure = [0.0, 34.19, 38.0];
  List<double> steamFlow = [0.0, 22.82, 25.0];
  List<double> waterLevel = [0.0, 55.41, 59.0];
  List<double> powerFrequency = [0.0, 50.08, 53.0];
  List<String> total = [ 'ABD1234 IS UNREACHABLE !', '1549.7kW', '1893.0KW'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(width*0.039),
      child: Container(
        height: height*0.55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color.fromRGBO(239, 239, 239, 1)),
        child: Column(
          children: [
            SizedBox(
              height: height*0.012,
            ),
            Text(
              total[factoryNumber],
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: width*0.05),
            ),
            Padding(
              padding: EdgeInsets.only(left: width*0.03, right: width*0.03, top: width*0.048),
              child: Row(
                children: [
                  Container(
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
                          text: 'Steam Pressure',
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
                                value: steamPressure[factoryNumber],
                                width: width*0.058,
                                color: Colors.green,
                              ),
                            ],
                            annotations: [
                              GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0.5,
                                widget: Text.rich(
                                  TextSpan(
                                    text: steamPressure[factoryNumber].toString(),
                                    style: TextStyle(
                                        fontSize: width*0.058,
                                        fontWeight: FontWeight.bold
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'bar',
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
                      )),
                  SizedBox(
                    width: width*0.036,
                  ),
                  Container(
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
                          text: 'Steam Flow',
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
                                value: steamFlow[factoryNumber],
                                width: width*0.058,
                                color: Colors.green,
                              ),
                            ],
                            annotations: [
                              GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0.5,
                                widget: Text.rich(
                                  TextSpan(
                                    text: steamFlow[factoryNumber].toString(),
                                    style: TextStyle(
                                        fontSize: width*0.058,
                                        fontWeight: FontWeight.bold
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'T/H',
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
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: width*0.036,),
            Padding(
              padding: EdgeInsets.only(left: width*0.03, right: width*0.03),
              child: Row(
                children: [
                  Container(
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
                          text: 'Water Level',
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
                                value: waterLevel[factoryNumber],
                                width: width*0.058,
                                color: Colors.green,
                              ),
                            ],
                            annotations: [
                              GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0.5,
                                widget: Text.rich(
                                  TextSpan(
                                    text: waterLevel[factoryNumber].toString(),
                                    style: TextStyle(
                                        fontSize: width*0.058,
                                        fontWeight: FontWeight.bold
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '%',
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
                      )),
                  SizedBox(
                    width: width*0.036,
                  ),
                  Container(
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
                          text: 'Power Frequency',
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
                                value: powerFrequency[factoryNumber],
                                color: Colors.green,
                              ),
                            ],
                            annotations: [
                              GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0.5,
                                widget: Text.rich(
                                  TextSpan(
                                    text: powerFrequency[factoryNumber].toString(),
                                    style: TextStyle(
                                        fontSize: width*0.058,
                                        fontWeight: FontWeight.bold
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Hz',
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
                      ))
                ],
              ),
            ),
            SizedBox(height: height*0.02),
            factoryNumber == 0 ?Text('--:--', style: TextStyle(fontSize: width*0.035),)
                :Text(DateTime.now().toString(), style: TextStyle(fontSize: width*0.035),),
          ],
        ),
      ),
    );
  }
}
