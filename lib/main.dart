import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator/models/quote_data.dart';
import 'package:quote_generator/screens/quotes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: QuotesScreen(),
      ),
    );
  }
}
