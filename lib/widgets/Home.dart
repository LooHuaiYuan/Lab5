import 'package:flutter/material.dart';
import 'package:lab5_2/widgets/gauge.dart';
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
                  Gauge(width: width, height: height, value: 50.08, parameter: "Steam Flow real", unit: "T/H"),
                  SizedBox(
                    width: width*0.036,
                  ),
                  Gauge(width: width, height: height, value: 50.08, parameter: "Steam Flow real", unit: "T/H")
                ],
              ),
            ),
            SizedBox(height: width*0.036,),
            Padding(
              padding: EdgeInsets.only(left: width*0.03, right: width*0.03),
              child: Row(
                children: [
                  Gauge(width: width, height: height, value: 50.08, parameter: "Steam Flow real", unit: "T/H"),
                  SizedBox(
                    width: width*0.036,
                  ),
                  Gauge(width: width, height: height, value: 50.08, parameter: "Steam Flow real", unit: "T/H")
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
