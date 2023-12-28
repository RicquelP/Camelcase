import 'package:flutter/material.dart';

class CustomCircle extends StatefulWidget {
 

  const CustomCircle({
    Key? key,
    required this.color,

    }): super(key: key);

    final Color color;

  @override
  State<CustomCircle> createState() => _CustomCircleState();
}

class _CustomCircleState extends State<CustomCircle> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 400.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.cyan,
          Colors.yellow,
        ],
      ),
        shape: BoxShape.circle,
      ),

    );

  }
}


class Customsecond_Circle extends StatelessWidget {
  const Customsecond_Circle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 400.0,
     decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.yellow,
      Colors.cyan,
          
        ],
      )),
    );
  }
}
