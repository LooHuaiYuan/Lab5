import 'package:flutter/material.dart';

import '../pages/application.dart';

class Otp extends StatefulWidget {

  Otp({super.key, required this.width, required this.height, required this.changeIndex});

  double width, height;
  Function changeIndex;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  int number = 0;
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Container(
      width: widget.width*0.88,
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
                      'Enter the activation code you received via SMS.',
                      style: TextStyle(
                        fontSize: widget.width*0.05,
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
            TextField(
              key: Key("otp"),
              style: TextStyle(fontSize: widget.width*0.035),
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
            SizedBox(height: widget.height*0.045),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive?' ,
                  style: TextStyle(
                      fontSize: widget.width*0.035
                  ),
                ),
                Text(
                  'Tap here',
                  style: TextStyle(
                    fontSize: widget.width*0.035,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
            SizedBox(height: widget.height*0.012,),
            GestureDetector(
              key: Key("otpButton"),
              onTap: (){
                //if(otp.text.isNotEmpty){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:(context)=>
                            Application(),));
                //}
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
                      fontSize: widget.width*0.05,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: widget.height*0.03,)
          ],
        ),
      ),
    );
  }
}
