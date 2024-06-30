import 'package:flutter/material.dart';
import 'package:lab5_2/widgets/Factory.dart';
import 'package:lab5_2/widgets/Home.dart';
import 'package:lab5_2/widgets/person.dart';

import '../widgets/Setting.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int currentIndex = 0;
  int focusFactory = 0;

  void changeFocus(int factory){
    setState(() {
      focusFactory = factory;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  'Factory ${focusFactory+1}',
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
        key: Key("factory"),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(213, 214, 214, 1)),
          child: Column(
            children: [
              currentIndex == 1
                  ? Home(factoryNumber: focusFactory,)
              : currentIndex == 0
                  ? Person(factoryNumber: focusFactory,)
                  : Setting(factoryNumber: focusFactory,),
              Padding(
                padding: EdgeInsets.all(width*0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width*0.036,
                      ),
                      Factory(width: width, height: height, index: 0, isFocus: focusFactory == 0, changeFocus: changeFocus),
                      SizedBox(
                        width: width*0.073,
                      ),
                      Factory(width: width, height: height, index: 1, isFocus: focusFactory == 1, changeFocus: changeFocus),

                      SizedBox(
                        width: width*0.073,
                      ),
                      Factory(width: width, height: height, index: 2, isFocus: focusFactory == 2, changeFocus: changeFocus),

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
