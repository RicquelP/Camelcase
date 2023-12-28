import 'package:animal_trivia/Screen/HomeScreen.dart';
import 'package:animal_trivia/Screen/login.dart';
import 'package:animal_trivia/Wigets/custom_circle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import '../main.dart';
void main() {
  runApp(MyApp());
}

class User {
  final String username;
  final String password;

  User({
    required this.username,
    required this.password,
  });
}

class AuthService {
  // This class contains authentication-related methods.

  Future<String> registerWithCustomAuth(User user) async {
    try {
     
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
       
        return 'custom_authentication_token';
      } else {
        // Registration failed.
        throw Exception('Registration failed: Invalid username or password');
      }
    } catch (e) {
      // Handle errors
      throw Exception('Registration error: $e');
    }
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: _Page(),
      ),
    );
  }

  Widget _Page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        children: [
          Positioned(
            left: 90.0,
            top: -20.0,
            child: CustomCircle(color: Colors.blue),
          ),
          Positioned(
            right: 90.0,
            top: 250.0,
            child: CustomCircle(
              color: Colors.blue,
            ),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _icon(),
                  SizedBox(height: 10),
                  inputField("Username", controller: _usernameController),
                  SizedBox(height: 10),
                  inputField("Password", controller: _passwordController, isPassword: true),
                  SizedBox(height: 10),
                  _SignupBtn(),
                  SizedBox(height: 10),
                  _extraText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        color: Colors.yellow,
        size: 120,
      ),
    );
  }

  Widget inputField(String hintText,
      {TextEditingController? controller, bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextFormField(
      controller: controller ?? TextEditingController(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _SignupBtn() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          User user = User(
            username: _usernameController.text.trim(),
            password: _passwordController.text.trim(),
          );

          try {
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: user.username,
              password: user.password,
            );

            if (userCredential.user != null) {
              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(), 
                                  ),
                                );
            } else {
           
              print('Registration failed');
            }
          } catch (e) {
          
            print('Registration error: $e');
          }
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Sign up",
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
    );
  }

  Widget _extraText() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => LoginPage()));
      },
      child: const Text(
        "Already have an Account?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
