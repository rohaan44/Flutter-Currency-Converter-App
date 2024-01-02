import 'dart:convert';
import 'package:currency_convertor/Model/currencies_model.dart';
import 'package:currency_convertor/Model/rates_model.dart';
import 'package:currency_convertor/res/app_url.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchRates() async {
  try {
    var response = await http.get(Uri.parse(AppUrl.ratesUrl));
    final ratesModel = ratesModelFromJson(response.body);
    return ratesModel;
  } catch (e) {
    throw Exception('Failed to fetch exchange rates: $e');
  }
}

Future<Map<String, dynamic>> fetchCurrencies() async {
  try {
    var response = await http.get(Uri.parse(AppUrl.currenciesUrl));
    final allCurrencies = allCurrenciesFromJson(response.body);
    return allCurrencies;
  } catch (e) {
    throw Exception('Failed to fetch currencies: $e');
  }
}

class ExchangeRateService {
  final String apiKey;
  final String apiUrl = 'https://open.er-api.com/v6/latest';

  ExchangeRateService(this.apiKey);

  Future<Map<String, dynamic>> getLatestExchangeRates() async {
    final response = await http.get(Uri.parse('$apiUrl?apikey=$apiKey'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}
