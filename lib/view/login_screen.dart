import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CurrenSee Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 27, 121),
          brightness: Brightness.dark,
        ),
        primaryColor: const Color.fromARGB(255, 0, 27, 121),
        hintColor: Colors.black,
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 237, 237),
        fontFamily: 'Lato',
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<Map<String, String>> registeredUsers = [
    {'email': 'aseef@example.com', 'password': '123'},
    {'email': 'ishaq@gmail.com', 'password': '123'},
    {'email': 'abdullah@gmail.com', 'password': '123'},
    {'email': 'usama@gmail.com', 'password': '123'},
    {'email': 'faiz@gmail.com', 'password': '123'},
    {'email': 'alirashid@gmail.com', 'password': '123'},
    {'email': 'aliyan@gmail.com', 'password': '123'},

    // Add more user details as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CurrenSee Converter'),
        backgroundColor: Color.fromARGB(255, 27, 6, 65),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Call the login function when the button is pressed
                login();
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the sign-up screen
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    // Get user input from controllers
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Validate inputs
    if (email.isEmpty || password.isEmpty) {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Check if the provided email and password match any registered user
      bool isValidUser = registeredUsers.any(
        (user) => user['email'] == email && user['password'] == password,
      );

      if (isValidUser) {
        // Navigate to the home screen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Show an error message if login fails
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid email or password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
