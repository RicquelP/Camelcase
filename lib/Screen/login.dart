import 'package:animal_trivia/Screen/HomeScreen.dart';
import 'package:animal_trivia/Screen/sign_in.dart';
import 'package:animal_trivia/Wigets/back_button.dart';
import 'package:animal_trivia/Wigets/custom_circle.dart';
import 'package:animal_trivia/Wigets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.yellow, Colors.cyan],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Positioned(
                right: 90.0,
                top: 250.0,
                child: CustomCircle(
                  color: Colors.blue,
                ),
              ),
              const Positioned(
                left: 90.0,
                top: -20.0,
                child: CustomCircle(color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      CustomBackButton(
                        width: 35.0,
                        text: 'Back',
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      const Text(
                        'Enter Your Username & Password',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      const TextFieldTitle(title: 'Username'),
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your username',
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const TextFieldTitle(title: 'Password'),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String email = _usernameController.text.trim();
                              String password = _passwordController.text.trim();
        
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
        
                             
                                if (userCredential.user != null) {
                                
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(), 
                                    ),
                                  );
                                } else {
                               
                                  print('User does not exist or login failed.');
                                }
                              } catch (e) {
                             
                                print('Login error: $e');
                              }
                            }
                          },
                          child: SizedBox(
                            width: size.width * 0.7,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Colors.white,
                            onPrimary: Colors.cyan,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          'Forgotten Password?',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Navigate to the sign-up screen
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignIn()));
                          },
                          child: const Text(
                            'Create New Account ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
