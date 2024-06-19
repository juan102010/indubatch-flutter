import '../../main/environment.dart';

/// Constant to verify server schema
const String serverSchema = "https";
String secretKeyOfEncrip = env['secretKey'] ?? '';
String urlGetCompany = env['serviceUrlApiProcesses'] ?? '';

/// Constant type authorization to the header
const String authHeaderKey = "x-access-token";
