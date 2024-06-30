import 'package:flutter/material.dart';
import 'package:lab5_2/Provider/HomeProvider.dart';
import 'package:lab5_2/widgets/Otp.dart';
import 'package:lab5_2/widgets/Phone.dart';
import 'package:provider/provider.dart';

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
  int index = 1;

  void changeIndex(){
    setState(() {
      index = 2;
    });
}

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
                    child: index == 1 ? Phone(width: width, height: height, changeIndex: changeIndex,)
                        : Otp(width: width, height: height,  changeIndex: changeIndex,),
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