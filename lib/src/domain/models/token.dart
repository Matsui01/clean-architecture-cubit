import 'dart:convert';

class Token {
  final String? tokenType;
  final String? accessToken;
  final String? refreshToken;
  final String? terminology;

  Token({
    this.tokenType,
    this.accessToken,
    this.refreshToken,
    this.terminology,
  });

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      tokenType: map['tokenType'] != null ? map['tokenType'] as String : null,
      accessToken: map['accessToken'] != null ? map['accessToken'] as String : null,
      refreshToken: map['refreshToken'] != null ? map['refreshToken'] as String : null,
      terminology: map['terminology'] != null ? map['terminology'] as String : null,
    );
  }

  String toMap() {
    return jsonEncode({
      'tokenType': tokenType,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'terminology': terminology,
    });
  }

  String get authorization => '$terminology $refreshToken';
}
