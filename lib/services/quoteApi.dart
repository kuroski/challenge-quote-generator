import 'dart:convert';

import 'package:http/http.dart' as http;

const API = 'https://quote-garden.herokuapp.com/api/v2/quotes/random';

class QuoteApi {
  Future randomQuote() async {
    http.Response response = await http.get(API);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['quote'];
    } else {
      print(response.statusCode);
      throw 'Problem fetching random quote';
    }
  }
}
