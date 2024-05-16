import 'package:flutter/material.dart';
import 'package:lab5_2/HomeProvider.dart';
import 'package:lab5_2/invitation.dart';
import 'package:provider/provider.dart';

class Person extends StatefulWidget {
  int factoryNumber;

  Person({super.key, required this.factoryNumber});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {

  List<String> nameList1 = ['Ben', 'Testing1', 'Hello'];
  List<String> phoneNumberList1 = ['+60109219938', '+601234567891', '60123456789', '1111'];
  List<String> nameList2 = ['Tom', 'Testing2', 'HelloWorld', '22'];
  List<String> phoneNumberList2 = ['+601110998321', '+60134533367', '60198755581', '11'];


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
            Expanded(
              child: ListView.separated(
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: EdgeInsets.only(top: width*0.02, left: width*0.03, right: width*0.03),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height*0.012,),
                              Padding(
                                padding: EdgeInsets.only(left: width*0.073, top: width*0.015),
                                child: Text(context.watch<HomeProvider>().nameList[widget.factoryNumber][index], style: TextStyle(fontSize: width*0.04),),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left:width*0.039),
                                    width: width*0.019,
                                    height: width*0.019,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: width*0.024,),
                                  Text(context.watch<HomeProvider>().phoneNumberList[widget.factoryNumber][index], style: TextStyle(fontSize: width*0.04),),
                                ],
                              ),
                              SizedBox(height: height*0.015,),
              
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder:(BuildContext context, int index){return SizedBox(height: height*0.01,);},
                    itemCount: context.watch<HomeProvider>().nameList[widget.factoryNumber].length),
            ),
            Padding(
              padding: EdgeInsets.all(width*0.039),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context)=>
                              Invitation(factoryNumber: widget.factoryNumber,),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(233, 221, 254, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Adjust border radius to match the container's border radius
                    ),
                    shadowColor: Colors.black,
                    elevation: 8.0
                  ),
                  child: Text('+', style: TextStyle(fontSize: width*0.08),),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
