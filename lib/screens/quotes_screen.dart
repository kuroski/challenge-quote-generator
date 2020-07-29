import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/models/quote.dart';
import 'package:quote_generator/services/quoteApi.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final _api = QuoteApi();
  Future<Quote> _quote;

  @override
  void initState() {
    super.initState();
    _quote = _api.randomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: _quote,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('ERROR');
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  RaisedButton(
                    child: Text('Random'),
                    onPressed: () {
                      setState(() {
                        _quote = _api.randomQuote();
                      });
                    },
                  ),
                  Text(
                    snapshot.data.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
