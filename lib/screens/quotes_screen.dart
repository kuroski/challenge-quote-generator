import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                        Icon(Icons.autorenew)
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

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '"${snapshot.data.text}"',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 50.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data.author,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      snapshot.data.genre,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                            onPressed: () => {},
                          ),
                        ],
                      );
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
