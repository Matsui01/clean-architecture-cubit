import 'dart:convert';

import 'package:clean_architecture_cubit/src/domain/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../get_it.dart';
import '../constants/storage_keys.dart';

class TokenStorage {
  static Future<Token> loadToken() async {
    final storage = getIt<FlutterSecureStorage>();
    final json = await storage.read(key: keyToken);
    final map = jsonDecode(json ?? '');
    map.map((key, value) => MapEntry(key.toString(), value));
    return Token.fromMap(map);
  }

  static Future<void> saveToken(Token? token) async {
    final storage = getIt<FlutterSecureStorage>();
    await storage.write(key: keyToken, value: token?.toMap());
  }
}
