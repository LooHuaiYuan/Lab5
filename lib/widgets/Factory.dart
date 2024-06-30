import 'package:flutter/material.dart';

class Factory extends StatefulWidget {

  double width, height;
  bool isFocus;
  Function changeFocus;
  int index;

  Factory({super.key, required this.width, required this.height, required this.isFocus,
    required this.changeFocus, required this.index});

  @override
  State<Factory> createState() => _FactoryState();
}

class _FactoryState extends State<Factory> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.isFocus ? Colors.blue : Colors.grey;
    return GestureDetector(
      child: Container(
        width: widget.width*0.425,
        height: widget.height*0.18,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
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
              size: widget.width*0.121,
            ),
            SizedBox(
              height: widget.height*0.012,
            ),
            Text(
              'Factory ${widget.index+1}',
              style: TextStyle(fontSize: widget.width*0.048),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          widget.changeFocus(widget.index);
        });
      },
    );
  }
}
