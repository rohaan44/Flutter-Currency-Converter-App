import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 6, 65),
          title: const Text("CurrenSee Converter")),
      body: HelpCenterPage(),
    );

    // conditional expression to decide which screen to show
    // ignore: dead_code
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 9.0),
          FAQItem(
            question: 'How do I reset my password?',
            answer:
                'You can reset your password by going to the login page and clicking on the "Forgot Password" link.',
            answer12:
                'You can reset your password by going to the login page and clicking on the "Forgot Password" link.',
          ),
          FAQItem(
            question: 'How to Use the App ?',
            answer:
                '1. View Live Exchange Rates: Press the button on the home screen to view live exchange rates.',
            answer2:
                '1. Conversion Card: Enter the amount, select source and target currencies, and press "Convert" to see the conversion result.',
            answer3:
                '2. Swap Currencies: You can swap the source and target currencies by pressing the swap icon.',
            answer4:
                '3. Help Center: Access the help center from the app bar for assistance.',
            answer5:
                '4. View Live Exchange Rates: Press the button on the home screen to view live exchange rates.',
          ),
          FAQItem(
            question: ' Troubleshooting Common Issues?',
            answer: 'V1 Error resolving ',
            answer8: 'V2 More Currency include',
            answer9: 'V2.1 Login/SignUP',
            answer10: 'V2.9 Complete Theme',
            answer11: 'V3.0 Latest Version',
            answer7: 'V1 Error resolving ',
          ),
          const SizedBox(height: 9.0),
          const Text(
            'For additional support, contact aptech@.edu.pk.com.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  String answer;
  final String? answer12;
  final String? answer1;
  final String? answer2;
  final String? answer3;
  final String? answer4;
  final String? answer5;
  final String? answer6;
  final String? answer7;
  final String? answer8;
  final String? answer9;
  final String? answer10;
  final String? answer11;

  FAQItem({
    required this.question,
    required this.answer,
    this.answer12,
    this.answer1,
    this.answer2,
    this.answer3,
    this.answer4,
    this.answer5,
    this.answer6,
    this.answer7,
    this.answer8,
    this.answer9,
    this.answer10,
    this.answer11,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (answer12 != null) Text(answer12!),
              if (answer1 != null) Text(answer1!),
              if (answer2 != null) Text(answer2!),
              if (answer3 != null) Text(answer3!),
              if (answer4 != null) Text(answer4!),
              if (answer5 != null) Text(answer5!),
              if (answer6 != null) Text(answer6!),
              if (answer7 != null) Text(answer7!),
              if (answer8 != null) Text(answer8!),
              if (answer9 != null) Text(answer9!),
              if (answer10 != null) Text(answer10!),
              if (answer11 != null) Text(answer11!),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(HelpScreen());
}
