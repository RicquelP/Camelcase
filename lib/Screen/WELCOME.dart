import 'package:animal_trivia/Screen/sign_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return  Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.yellow,
          Colors.green,
        ],
      )),
    
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TweenAnimationBuilder(
              tween: Tween(begin: mq.width * 0.5, end: -mq.width * 0.15),
              duration: Duration(seconds: 1),
              builder: (context, double value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child:   Container(
                    width: 200,// Adjust the width of the container
                    height: 200, 
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                              child: ClipOval(
                                child: Image.asset(
                                  'images/run.png', 
                                  width: 50, 
                                  height: 60, 
                                  fit: BoxFit.cover,
                                ),
                     ),
           
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 50,),
          const Column(
            children: [
              Text('Anaimal Kingdom',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.cyan),),
              Text('What do you know about the',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 20),),
              Text('animal Kingdom?',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 20))
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> SignIn()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 320,left: 180),
              child: Container(
                    height: 65.0,
                    width: 200.0,
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
                'Get Started',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
