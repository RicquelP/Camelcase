import 'package:animal_trivia/Screen/QuizScreen.dart';
import 'package:animal_trivia/Wigets/CategoryText.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search_rounded, color: Colors.cyan),
                 GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> QuizScreen()));
                  },
                   child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                           boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(child: Text('Start Game',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
                    ),
                 ),
                Icon(Icons.menu, color: Colors.cyan)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 120),
            child: Text(
              'Animal Kingdom',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.cyan,
              ),
            ),
          ),
          SizedBox(height: 20,),
          
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryText("Popular",),
                  CategoryText("Mammalians"),
                  CategoryText("Amphibians"),
                  CategoryText("Maine mammals"),
                  CategoryText("Reptiles"), 
                ],
              ),
            )
            ),
            
            Container(
              height:550,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //First Animal Container
                  Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                         boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Amphibians',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
                                SizedBox(height: 30,),
                                 Text('Crocodile',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 25))
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: Container(
                              height: 160,
                              width:200,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/dile.png'))
                              ),
                            ),
                          )
                        ],
                      ),
                  ),

 //Second Animal Container
                  Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                         boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Mammalians',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
                                SizedBox(height: 30,),
                                 Text('Lion',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 25))
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: Container(
                              height: 160,
                              width:200,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/lion.png'))
                              ),
                            ),
                          )
                        ],
                      ),
                  ),

 //Third Animal Container
                   Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                         boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Mammalians',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
                                SizedBox(height: 30,),
                                 Text('Bear',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 25))
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: Container(
                              height: 160,
                              width:200,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/bear.png'))
                              ),
                            ),
                          )
                        ],
                      ),
                  ),

 //Forth Animal Container
                  Container(
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                         boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('marine mammals',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
                                SizedBox(height: 30,),
                                 Text('Blue Whale',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 25))
                              ],
                            ),
                          ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: Container(
                              height: 160,
                              width:200,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/wail.png'))
                              ),
                            ),
                          )
                        ],
                      ),
                  ),

                ]
              )
            )
        ]
          ),
        
      );
    
  }
}


