import '../../main/environment.dart';

/// Constant to verify server schema
const String serverSchemaNoSecure = "http";
const String serverSchemaSecure = "https";

/// Constant to enviroment server autority

//const String serverAuthority = ""; // Prod URL enviroment
String serverAuthorityWebApi =
    env['serviceUrlWebApi'] ?? ''; // Development URL enviroment

String serverAuthorityWebApiNodeJS =
    env['serviceUrlWebApiNodeJS'] ?? ''; // Development URL enviroment

/// Constant type authorization to the header
const String authHeaderKey = "x-access-token";
const String nameKey = "";
const String resetHeaderKey = "reset";

/// Constant API key connection

const String passwordKey = "GUID";

/// DEV MODE
const bool isDevMode = true;

/// Prod MODE
const bool isProdMode = true;
