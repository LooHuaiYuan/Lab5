import 'package:flutter/material.dart';
import 'package:lab5_2/Home.dart';
import 'package:lab5_2/person.dart';

import 'Setting.dart';

void main() {
  runApp(const MaterialApp(
    home: Application(),
  ));
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int currentIndex = 0;
  int factory = 0;
  Color factory1 = Colors.blue;
  Color factory2 = Colors.grey;
  Color factory3 = Colors.grey;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  'Factory ${factory+1}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: width*0.05),
                ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        }, icon: Icon(Icons.settings))],
      ),
      backgroundColor: Color.fromRGBO(213, 214, 214, 1),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(213, 214, 214, 1)),
          child: Column(
            children: [
              currentIndex == 1
                  ? Home(factoryNumber: factory,)
              : currentIndex == 0
                  ? Person(factoryNumber: factory,)
                  : Setting(factoryNumber: factory,),
              Padding(
                padding: EdgeInsets.all(width*0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width*0.036,
                      ),
                      GestureDetector(
                        child: Container(
                          width: width*0.425,
                          height: height*0.18,
                          decoration: BoxDecoration(
                            border: Border.all(color: factory1, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(247, 248, 247, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(0, 3), // Offset
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.factory_outlined,
                                size: width*0.121,
                              ),
                              SizedBox(
                                height: height*0.012,
                              ),
                              Text(
                                'Factory 1',
                                style: TextStyle(fontSize: width*0.048),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            factory1 = Colors.blue;
                            factory2 = Colors.grey;
                            factory3 = Colors.grey;
                            factory = 0;
                          });
                        },
                      ),
                      SizedBox(
                        width: width*0.073,
                      ),
                      GestureDetector(
                        child: Container(
                          width: width*0.425,
                          height: height*0.18,
                          decoration: BoxDecoration(
                            border: Border.all(color: factory2, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(247, 248, 247, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(0, 3), // Offset
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.factory_outlined,
                                size: width*0.121,
                              ),
                              SizedBox(
                                height: height*0.012,
                              ),
                              Text(
                                'Factory 2',
                                style: TextStyle(fontSize: width*0.048),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            factory2 = Colors.blue;
                            factory1 = Colors.grey;
                            factory3 = Colors.grey;
                            factory = 1;
                          });
                        },
                      ),
                      SizedBox(
                        width: width*0.073,
                      ),
                      GestureDetector(
                        child: Container(
                          width: width*0.426,
                          height: height*0.18,
                          decoration: BoxDecoration(
                            border: Border.all(color: factory3, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(247, 248, 247, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(0, 3), // Offset
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.factory_outlined,
                                size: width*0.121,
                              ),
                              SizedBox(
                                height: height*0.012,
                              ),
                              Text(
                                'Factory 3',
                                style: TextStyle(fontSize: width*0.048),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            factory1 = Colors.grey;
                            factory2 = Colors.grey;
                            factory3 = Colors.blue;
                            factory = 2;
                          });
                        },
                      ),
                      SizedBox(
                        width: width*0.036,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
