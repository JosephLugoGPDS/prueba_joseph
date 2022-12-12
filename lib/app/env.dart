import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static final String uriBase = 'https://${dotenv.get('URI_BASE', fallback: 'exception dotenv: uri base')}';
}