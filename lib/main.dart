import 'package:flutter/material.dart';
import 'package:lab5_2/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'application.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider())
      ],
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkbox = false;
  int index = 1;
  int number = 0;
  TextEditingController phone = new TextEditingController();
  TextEditingController otp = new TextEditingController();

  // This widget is the root of your application.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width*0.024),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "images/upm.png",
                  width: width*0.48,
                  height: height*0.11,),
                SizedBox(height: height*0.024,),
                Text(
                  'Welcome !',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width*0.1,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(width*0.005),
                    child: index == 1 ? Container(
                      width: width*0.88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromRGBO(254, 217, 217, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Set shadow color
                            spreadRadius: 5, // Set spread radius
                            blurRadius: 7, // Set blur radius
                            offset: Offset(0, 3), // Set offset
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(width*0.02),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Enter your mobile number to activate your account',
                                      style: TextStyle(
                                        fontSize: width*0.0525,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width*0.024,),
                                  Icon(
                                    Icons.info_outline,
                                    size: width*0.085,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.06,),
                            Row(
                              children: [
                                Image.asset(
                                    "images/malaysia.png",
                                  width: width*0.15,
                                  height: width*0.07,
                                ),
                                SizedBox(width: width*0.024,),
                                Text('+60', style: TextStyle(fontSize: width*0.04),),
                                SizedBox(width: width*0.048,),
                                Expanded(
                                  child: TextField(
                                    controller: phone,
                                  style: TextStyle(fontSize: width*0.035),
                                  decoration: InputDecoration(
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
                            SizedBox(height: width*0.073,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: checkbox,
                                    onChanged: (bool? expression) {
                                      setState(() {
                                        checkbox = !checkbox;
                                      });
                                    }),
                                Text(
                                  'I agree to the terms & conditions',
                                  style: TextStyle(
                                    fontSize: width*0.035
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: width*0.02,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(checkbox && phone.text.isNotEmpty) {
                                    index = 2;
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white70,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Text(
                                      'Get Activation Code',
                                    style: TextStyle(
                                      color: Color.fromRGBO(109, 87, 167, 1),
                                      fontSize: width*0.055,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.045,)
                          ],
                        ),
                      ),
                    )
                        : Container(
                      width: width*0.88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Set shadow color
                            spreadRadius: 5, // Set spread radius
                            blurRadius: 7, // Set blur radius
                            offset: Offset(0, 3), // Set offset
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(width*0.02),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Enter the activation code you received via SMS.',
                                      style: TextStyle(
                                        fontSize: width*0.05,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width*0.024,),
                                  Icon(
                                    Icons.info_outline,
                                    size: width*0.085,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.06,),
                            TextField(
                              style: TextStyle(fontSize: width*0.035),
                              textAlign: TextAlign.center,
                              controller: otp,
                              onChanged: (value){
                                setState(() {
                                  number = otp.text.length;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'OTP',
                                counterText: '$number/6',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.045),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Didn\'t receive?' ,
                                  style: TextStyle(
                                      fontSize: width*0.035
                                  ),
                                ),
                                Text(
                                  'Tap here',
                                  style: TextStyle(
                                    fontSize: width*0.035,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height*0.012,),
                            GestureDetector(
                              onTap: (){
                                if(otp.text.isNotEmpty){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:(context)=>
                                            Application(),));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color.fromRGBO(247, 241, 249, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Text(
                                    'Activate',
                                    style: TextStyle(
                                      color: Color.fromRGBO(109, 87, 167, 1),
                                      fontSize: width*0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.03,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.035,),
                Center(
                  child: Text(
                    'Disclaimer | Privacy Statement',
                    style: TextStyle(
                      fontSize: width*0.035,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: height*0.024,),
                Center(
                  child: Text(
                      'Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn. Bhd.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width*0.037
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}