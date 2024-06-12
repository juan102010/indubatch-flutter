import 'package:flutter/material.dart';
import 'package:indubatch_movil/injection_container.dart.dart';
import 'package:indubatch_movil/maincommon.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();

  runApp(const MyApp());
}
