import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_generator/models/quote.dart';

const API = 'https://quote-garden.herokuapp.com/api/v2/quotes/random';

class QuoteApi {
  Future<Quote> randomQuote() async {
    http.Response response = await http.get(API);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return Quote.fromJson(decodedData['quote']);
    } else {
      print(response.statusCode);
      throw 'Problem fetching random quote';
    }
  }
}
