import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/models/quote_data.dart';

class QuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuoteData>(context);
    String quote = '';
    if (provider.quote != null) {
      quote = provider.quote.text;
    } else {
      quote = 'Random quote';
    }

    return Container(
      child: Center(
        child: RaisedButton(
          child: Text(quote),
          onPressed: provider.randomQuote,
        ),
      ),
    );
  }
}
