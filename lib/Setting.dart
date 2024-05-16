import 'package:flutter/material.dart';
import 'package:lab5_2/HomeProvider.dart';
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
                          IconButton(onPressed: (){
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
                  Padding(
                    padding: EdgeInsets.only(left: width*0.048),
                    child: Container(
                      width: width*0.365,
                      child: Column(
                        children: [
                          Text(
                              'Steam Pressure',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1,
                                fontSize: width*0.055,
                            fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(width*0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.black,
                                )
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width*0.0121),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: width*0.19,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: steamPressureTF,
                                          enabled: enable,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width*0.073
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none
                                          ),
                                        )
                                    ),
                                    Container(height: height*0.085,child: VerticalDivider(thickness: 1, width: 10.0, color: Colors.black,)),
                                    Text(
                                      'bar',
                                      style: TextStyle(
                                        fontSize: width*0.048,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width*0.039),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.039),
                    child: Container(
                      width: width*0.365,
                      child: Column(
                        children: [
                          Container(
                            width: width*0.24,
                            child: Text(
                              'Steam Flow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1,
                                  fontSize: width*0.055,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(width*0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.black,
                                  )
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width*0.0121),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: width*0.19,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: steamFlowTF,
                                          enabled: enable,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: width*0.073
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none
                                          ),
                                        )
                                    ),
                                    Container(height: height*0.085,child: VerticalDivider(thickness: 1, width: 10.0, color: Colors.black,)),
                                    Text(
                                      'T/H',
                                      style: TextStyle(
                                          fontSize: width*0.048,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height*0.012,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width*0.048),
                    child: Container(
                      width: width*0.365,
                      child: Column(
                        children: [
                          Container(
                            width: width*0.24,
                            child: Text(
                              'Water Level',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1,
                                  fontSize: width*0.055,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(width*0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.black,
                                  )
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width*0.0121),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: width*0.19,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: waterLevelTF,
                                          enabled: enable,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: width*0.073
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none
                                          ),
                                        )
                                    ),
                                    Container(height: height*0.085,child: VerticalDivider(thickness: 1, width: 10.0, color: Colors.black,)),
                                    Text(
                                      '%',
                                      style: TextStyle(
                                          fontSize: width*0.048,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width*0.048,),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.048),
                    child: Container(
                      width: width*0.365,
                      child: Column(
                        children: [
                          Text(
                            'Power Frequency',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1,
                                fontSize: width*0.055,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(width*0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.black,
                                  )
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width*0.0121),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width:width*0.19,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: powerFrequencyTF,
                                          enabled: enable,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: width*0.073
                                          ),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                          ),
                                        )
                                    ),
                                    Container(height: height*0.085,child: VerticalDivider(thickness: 1, width: 10.0, color: Colors.black,)),
                                    Text(
                                      'Hz',
                                      style: TextStyle(
                                          fontSize: width*0.048,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}
