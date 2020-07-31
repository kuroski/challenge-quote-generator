class Quote {
  final String id;
  final String text;
  final String author;
  final String genre;

  Quote({this.id, this.text, this.author, this.genre});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        id: json['_id'],
        author: json['quoteAuthor'],
        text: json['quoteText'],
        genre: json['quoteGenre']);
  }
}
