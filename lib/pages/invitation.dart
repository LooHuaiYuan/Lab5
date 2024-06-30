import 'package:flutter/material.dart';
import 'package:lab5_2/Provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class Invitation extends StatelessWidget {
  int factoryNumber;
  Invitation({super.key, required this.factoryNumber});

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(213, 214, 214, 1),
      appBar: AppBar(
        title: Text('Factory ${factoryNumber+1}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.all(width*0.039),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                        'Invitation',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width*0.1,
                      ),
                    )),
                Center(child: Text('Invite users', style: TextStyle(fontSize: width*0.048),)),
                SizedBox(height: height*0.012,),
                Text('Owner\'s Name', style: TextStyle(fontSize: width*0.048),),
                SizedBox(height: height*0.006,),
                Container(
                  height: height*0.1,
                    child: TextField(
                      key: Key("name"),
                      style: TextStyle(fontSize: width*0.04),
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Type Here',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.black)
                        )
                      ),
                    )),
                SizedBox(height: height*0.006,),
                Text('Owner\'s Phone Number', style: TextStyle(fontSize: width*0.036),),
                Row(
                  children: [
                    Image.asset(
                      "images/malaysia.png",
                      width: width*0.121,
                      height: height*0.0365,
                    ),
                    SizedBox(width: width*0.024,),
                    Text('+60', style: TextStyle(fontSize: width*0.036),),
                    SizedBox(width: width*0.048,),
                    Expanded(child:
                    TextField(
                      key: Key("phone"),
                      style: TextStyle(fontSize: width*0.036),
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),)
                  ],
                ),
                SizedBox(height: height*0.024,),
                Padding(
                  padding: EdgeInsets.all(width*0.019),
                  child: GestureDetector(
                    key: Key("Submit"),
                    onTap: (){
                      context.read<HomeProvider>().addPhone(factoryNumber, name.text, phone.text);
                      Navigator.of(context).pop(
                          MaterialPageRoute(
                          builder:(context)=>
                      Invitation(factoryNumber: factoryNumber,),));
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: width*0.121,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 154, 158, 1),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                            'Submit',
                          style: TextStyle(
                            fontSize: width*0.048,
                            color: Color.fromRGBO(119, 104, 162, 1)
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
