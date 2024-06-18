import '../../main/environment.dart';

/// Constant to verify server schema
const String serverSchemaNoSecure = "http";
const String serverSchemaSecure = "https";
String secretKeyOfEncrip = env['secretKey'] ?? '';

/// Constant type authorization to the header
const String authHeaderKey = "x-access-token";
