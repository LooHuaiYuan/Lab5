import 'package:flutter/material.dart';

class ThresholdFactory extends StatefulWidget {

  double width, height, value;
  String parameter, unit;

  ThresholdFactory({super.key, required this.width, required this.height, required this.value, required this.parameter, required this.unit});

  @override
  State<ThresholdFactory> createState() => _ThresholdFactoryState();
}

class _ThresholdFactoryState extends State<ThresholdFactory> {

  TextEditingController valueTF = TextEditingController();
  @override
  void initState() {
    super.initState();
    valueTF.text = widget.value.toString();
  }
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.only(left: widget.width*0.048),
      child: Container(
        width: widget.width*0.365,
        child: Column(
          children: [
            Text(
              widget.parameter,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1,
                  fontSize: widget.width*0.055,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(widget.width*0.02),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.black,
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: widget.width*0.0121),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: widget.width*0.19,
                          child: TextField(
                            key: Key("Pressure"),
                            textAlign: TextAlign.center,
                            controller: valueTF,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: widget.width*0.073
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                            onChanged: (newValue){
                              setState(() {
                                widget.value = double.tryParse(newValue)!;
                              });
                            },
                          )
                      ),
                      Container(height: widget.height*0.085,child: VerticalDivider(thickness: 1, width: 10.0, color: Colors.black,)),
                      Text(
                        widget.unit,
                        style: TextStyle(
                            fontSize: widget.width*0.048,
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
    );
  }
}
