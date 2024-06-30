import 'package:flutter/material.dart';
import 'package:lab5_2/Provider/HomeProvider.dart';
import 'package:lab5_2/widgets/ThresholdFactory.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  int factoryNumber = 1;

  Setting({super.key, required this.factoryNumber});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  TextEditingController steamPressureTF = TextEditingController();
  TextEditingController steamFlowTF = TextEditingController();
  TextEditingController waterLevelTF = TextEditingController();
  TextEditingController powerFrequencyTF = TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    steamPressureTF.text = context.watch<HomeProvider>().steamPressure[widget.factoryNumber].toString();
    steamFlowTF.text = context.watch<HomeProvider>().steamFlow[widget.factoryNumber].toString();
    waterLevelTF.text = context.watch<HomeProvider>().waterLevel[widget.factoryNumber].toString();
    powerFrequencyTF.text = context.watch<HomeProvider>().powerFrequency[widget.factoryNumber].toString();
    return Padding(
        padding: EdgeInsets.all(width*0.039),
        child: Container(
          height: height*0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Color.fromRGBO(239, 239, 239, 1)
          ),
          child: Column(
            children: [
              SizedBox(height: height*0.024,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Minimum Threshold',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width*0.05
                    ),
                  ),
                  Icon(Icons.info_outline),
                  Container(
                      width: width*0.19,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 241, 249, 1),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            key:Key("edit"),
                              onPressed: (){
                            setState(() {
                              enable = !enable;
                            });
                            context.read<HomeProvider>().changeSteamPressure(widget.factoryNumber, double.parse(steamPressureTF.text));
                            context.read<HomeProvider>().changeSteamFlow(widget.factoryNumber, double.parse(steamFlowTF.text));
                            context.read<HomeProvider>().changeWaterLevel(widget.factoryNumber, double.parse(waterLevelTF.text));
                            context.read<HomeProvider>().changePowerFrequency(widget.factoryNumber, double.parse(powerFrequencyTF.text));
                          }, icon: Icon(Icons.edit)),
                        ],
                      ))
                ],
              ),
              SizedBox(height: height*0.024,),
              Row(
                children: [
                  ThresholdFactory(width: width, height: height,value:12 , parameter: "Steam Pressure", unit: "bar"),
                  SizedBox(width: width*0.039,),
                  ThresholdFactory(width: width, height: height,value:12 , parameter: "Steam Pressure", unit: "bar"),
                ],
              ),
              SizedBox(height: height*0.012,),
              Row(
                children: [
                  ThresholdFactory(width: width, height: height,value:12 , parameter: "Steam Pressure", unit: "bar"),

                  SizedBox(width: width*0.048,),
                  ThresholdFactory(width: width, height: height,value:12 , parameter: "Steam Pressure", unit: "bar"),
                ],
              )
            ],
          ),
        ),
      );
  }
}
