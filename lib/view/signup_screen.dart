import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 6, 65),
          leading: const Icon(Icons.currency_exchange),
          title: const Text('CurrenSee Converter'),
        ),
        body: YourHomePageWidget(), // Replace with your actual home page widget
      ),
    );
  }
}

class YourHomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<Map<String, String>> registeredUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Full Name';
                }
                return null;
              },
            ),
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
                // Call the sign-up function when the button is pressed
                signUp();
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                // Navigate back to the login screen
                Navigator.pop(context);
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  void signUp() {
    // ... (Your existing signUp function remains the same)
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
