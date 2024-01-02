import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CurrenSee Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(6, 35, 26, 1),
          brightness: Brightness.dark,
        ),
        primaryColor: Color.fromRGBO(139, 199, 136, 1),
        hintColor: Color.fromRGBO(139, 199, 136, 1),
        scaffoldBackgroundColor: Color.fromRGBO(6, 35, 26, 1),
        fontFamily: 'Lato',
      ),
    );
  }
}

class LiveExchangeRatesWidget extends StatelessWidget {
  const LiveExchangeRatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageSlider(),
            const SizedBox(height: 16.0),
            const Text(
              'Live Exchange Rates',
              style: textStyle,
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Currency'),
                Text('Exchange Rate'),
              ],
            ),
            const SizedBox(height: 8.0),
            Image.asset(
              'assets/CurrenSee.jpg',
              fit: BoxFit.fill,
            ),
            // Add more ExchangeRateRow widgets as needed
          ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/Aud.JPG',
    'assets/Cad.jpg',
    'assets/Usd.jpg',
    'assets/Eur.jpg',
    'assets/Gbp.jpg',
    'assets/Chf.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}

class ExchangeRateRow extends StatelessWidget {
  final String currency;
  final double rate;

  const ExchangeRateRow({
    Key? key,
    required this.currency,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(currency),
          Text(rate.toString()),
        ],
      ),
    );
  }
}
