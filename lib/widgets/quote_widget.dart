import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_generator/models/quote.dart';
import 'package:quote_generator/screens/author_screen.dart';

class QuoteWidget extends StatefulWidget {
  final Quote quote;
  final bool displayAuthor;

  QuoteWidget({@required this.quote, this.displayAuthor = true});

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  Color authorColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    BoxDecoration quoteBorder = (MediaQuery.of(context).size.width < 600.0)
        ? BoxDecoration()
        : BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 5.0,
                color: Colors.yellow[600],
              ),
            ),
          );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          decoration: quoteBorder,
          child: Text(
            '"${widget.quote.text}"',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        if (widget.displayAuthor)
          MouseRegion(
            onHover: (event) {
              setState(() {
                authorColor = Colors.white;
              });
            },
            onExit: (event) {
              setState(() {
                authorColor = Colors.black;
              });
            },
            child: FlatButton(
              hoverColor: Colors.black87,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.quote.author,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: authorColor,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.quote.genre,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthorScreen(
                    quote: widget.quote,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
