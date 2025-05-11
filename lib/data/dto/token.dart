class Token {
  String token;

  Token(this.token);

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(json['token']);
  }
}