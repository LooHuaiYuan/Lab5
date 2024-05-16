import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  //data for setting page
  List<double> steamPressure = [0.0, 29.0, 34.0];
  List<double> steamFlow = [0.0, 22.0, 24.0];
  List<double> waterLevel = [0.0, 53.0, 55.0];
  List<double> powerFrequency = [0.0, 48.0, 52.0];

  //data for person page
  List<List<String>> nameList = [['Ben', 'Testing1', 'Hello'], ['Tom', 'Testing2', 'HelloWorld'], ['Jack', 'Testing3', 'Hey'] ];
  List<List<String>> phoneNumberList = [['+60109219938', '+601234567891', '60123456789'], ['+601110998321', '+60134533367', '60198755581'], ['+601132324567', '+60134537789', '60198751201']];

  //method for setting page
  void changeSteamPressure(int factory, double value){
    steamPressure[factory] = value;
    notifyListeners();
  }

  void changeSteamFlow(int factory, double value){
    steamFlow[factory] = value;
    notifyListeners();
  }

  void changeWaterLevel(int factory, double value){
    waterLevel[factory] = value;
    notifyListeners();
  }

  void changePowerFrequency(int factory, double value){
    powerFrequency[factory] = value;
    notifyListeners();
  }

  //method for invitation page
  void addPhone(int factory, String name, String phone){
    nameList[factory].add(name);
    phoneNumberList[factory].add('+60$phone');
    notifyListeners();
  }

}