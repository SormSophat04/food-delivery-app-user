// lib/env.dart
import 'dart:io';
import 'package:dotenv/dotenv.dart';

class Env {
  // 1. A private static variable to hold the loaded state
  static final _env = DotEnv(includePlatformEnvironment: true)..load();

  // 2. A getter to access variables
  static String get(String key) {
    // Check if the key exists in the OS environment (Production)
    // If not, check the .env file (Local Dev)
    String? value = Platform.environment[key] ?? _env[key];

    if (value == null || value.isEmpty) {
      print('WARNING: Environment variable $key not found');
      return '';
    }

    // Remove surrounding quotes if present
    if ((value.startsWith("'") && value.endsWith("'")) ||
        (value.startsWith('"') && value.endsWith('"'))) {
      value = value.substring(1, value.length - 1);
    }

    print('Loaded $key: $value');
    return value;
  }
}