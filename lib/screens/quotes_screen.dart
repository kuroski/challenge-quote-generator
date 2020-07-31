import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_generator/models/quote.dart';
import 'package:quote_generator/screens/author_screen.dart';
import 'package:quote_generator/services/quoteApi.dart';
import 'package:quote_generator/widgets/quote_widget.dart';

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
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  FlatButton(
                    child: Row(
                      children: [
                        Text('random'),
                        SizedBox(width: 5.0),
                        Icon(Icons.autorenew),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        _quote = _api.randomQuote();
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: FutureBuilder(
                    future: _quote,
                    builder: (context, AsyncSnapshot<Quote> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text(
                            'Error during quote fetching, try again later.');
                      }

                      return QuoteWidget(quote: snapshot.data);
                    },
                  ),
                ),
              ),
              Text(
                'Kuroski @ DevChallendes.io',
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
