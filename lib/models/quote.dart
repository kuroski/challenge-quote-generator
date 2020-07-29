class Quote {
  final String id;
  final String text;
  final String author;

  Quote({this.id, this.text, this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        id: json['_id'], author: json['quoteAuthor'], text: json['quoteText']);
  }
}
