import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/models/quote.dart';
import 'package:quote_generator/services/quoteApi.dart';
import 'package:quote_generator/widgets/quote_widget.dart';

class AuthorScreen extends StatelessWidget {
  final _api = QuoteApi();
  final Quote quote;

  AuthorScreen({Key key, @required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    quote.author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Expanded(
                child: FutureBuilder(
                  future: _api.fromAuthor(quote.author),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text(
                          'Error during quote fetching, try again later.');
                    }

                    return ListView(
                      children: [
                        for (Quote quote in snapshot.data)
                          QuoteWidget(
                            quote: quote,
                            displayAuthor: false,
                          )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
