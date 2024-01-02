import 'package:currency_convertor/Model/rates_model.dart';
import 'package:currency_convertor/View/Widgets/conversion_card.dart';
import 'package:currency_convertor/data/network/api_services.dart';
import 'package:currency_convertor/view/help_screen.dart';
import 'package:currency_convertor/view/widgets/LiveExchangeRatesWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      // Use a conditional expression to decide which screen to show
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RatesModel> ratesModel;
  late Future<Map> currenciesModel;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    ratesModel = fetchRates();
    currenciesModel = fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 6, 65),
        leading: const Icon(Icons.currency_exchange),
        title: const Text('CurrenSee Converter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LiveExchangeRatesWidget(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<RatesModel>(
        future: ratesModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder<Map>(
              future: currenciesModel,
              builder: (context, index) {
                if (index.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (index.hasError) {
                  return Center(child: Text('Error: ${index.error}'));
                } else {
                  return ConversionCard(
                    rates: snapshot.data!.rates,
                    currencies: index.data!,
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
