import 'package:flutter/material.dart';

class Phone extends StatefulWidget {

  Phone({super.key, required this.width, required this.height, required this.changeIndex});

  double width, height;
  Function changeIndex;

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {

  bool checkbox = false;
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Container(
      width: widget.width*0.88,
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
        padding: EdgeInsets.all(widget.width*0.03),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(widget.width*0.02),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Enter your mobile number to activate your account',
                      style: TextStyle(
                        fontSize: widget.width*0.0525,
                      ),
                    ),
                  ),
                  SizedBox(width: widget.width*0.024,),
                  Icon(
                    Icons.info_outline,
                    size: widget.width*0.085,
                  ),
                ],
              ),
            ),
            SizedBox(height: widget.height*0.06,),
            Row(
              children: [
                Image.asset(
                  "images/malaysia.png",
                  width: widget.width*0.15,
                  height: widget.width*0.07,
                ),
                SizedBox(width: widget.width*0.024,),
                Text('+60', style: TextStyle(fontSize: widget.width*0.04),),
                SizedBox(width: widget.width*0.048,),
                Expanded(
                  child: TextField(
                    key: Key("email"),
                    controller: phone,
                    style: TextStyle(fontSize: widget.width*0.035),
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
            SizedBox(height: widget.width*0.073,),
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
                      fontSize: widget.width*0.035
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.width*0.02,),
            GestureDetector(
              key: Key("activate"),
              onTap: (){
                setState(() {
                  //if(checkbox && phone.text.isNotEmpty) {
                    widget.changeIndex();
                  //}
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
                      fontSize: widget.width*0.055,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: widget.height*0.045,)
          ],
        ),
      ),
    );
  }
}
