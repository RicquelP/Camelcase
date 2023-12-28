

import 'package:animal_trivia/Screen/HomeScreen.dart';
import 'package:animal_trivia/Screen/sign_in.dart';
import 'package:flutter/material.dart';


class CustomBackButton extends StatelessWidget {
   final double width;
  final String text;
  
  const CustomBackButton({Key? key, required this.width, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
},

      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        height: 35.0,
        width: 35.0,
    
        decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.cyan,
          Colors.yellow,
        ],
      ),
            shape: BoxShape.circle,),
            
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }
} 

 class CustomLoginButton extends StatelessWidget {
  final double width;
  final String text;

  const CustomLoginButton({Key? key, required this.width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomeScreen()));
      },
      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        height: 45.0,
        width: 185.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0),
          ),
         gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.yellow,
          Colors.cyan,
        ],
      ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
