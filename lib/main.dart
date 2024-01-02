import 'package:currency_convertor/view/home_screen.dart';
import 'package:currency_convertor/view/login_screen.dart';
import 'package:currency_convertor/view/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the user is authenticated
    bool isAuthenticated = false; // Replace with your authentication logic

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 0, 0, 0),
          brightness: Brightness.dark,
        ),
        primaryColor: Color.fromARGB(255, 254, 255, 254),
        hintColor: Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: Color.fromARGB(255, 10, 7, 37),
        fontFamily: 'Lato',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 27, 6, 65),
        ),
      ),
      // Use a conditional expression to decide which screen to show
      // ignore: dead_code
      home: isAuthenticated ? const HomeScreen() : LoginScreen(),
      routes: {
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
