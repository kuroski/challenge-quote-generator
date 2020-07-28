import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quote_generator/models/quote.dart';
import 'package:quote_generator/services/quoteApi.dart';

const API = 'https://quote-garden.herokuapp.com/api/v2/quotes/random';

class QuoteData extends ChangeNotifier {
  final _api = QuoteApi();
  Quote _quote;

  Quote get quote {
    return _quote;
  }

  Future<void> randomQuote() async {
    final result = await _api.randomQuote();
    _quote = Quote(result['_id'], result['quoteText'], result['quoteAuthor']);
    notifyListeners();
  }
}
