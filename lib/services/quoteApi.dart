import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_generator/models/quote.dart';

const API = 'https://quote-garden.herokuapp.com/api/v2';

class QuoteApi {
  Future<Quote> randomQuote() async {
    http.Response response = await http.get("$API/quotes/random");
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return Quote.fromJson(decodedData['quote']);
    } else {
      print(response.statusCode);
      throw 'Problem fetching random quote';
    }
  }

  Future<List<Quote>> fromAuthor(String author) async {
    http.Response response = await http.get("$API/authors/$author");
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return List.from(decodedData['quotes'])
          .map((quote) => Quote.fromJson(quote))
          .toList();
    } else {
      print(response.statusCode);
      throw 'Problem fetching random quote';
    }
  }
}
