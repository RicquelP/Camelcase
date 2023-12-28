import 'package:flutter/material.dart';


class CustumBTN extends StatelessWidget {
  const CustumBTN({
    Key? key,
    required this.width,
    required this.text,
    required Size size,
  }) : super(key: key);

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
          
          borderRadius: BorderRadius.only(
            
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
               gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.yellow,
          Colors.cyan,
        ],
      )),
            
              
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        )),
      ),
    );
  }
}
