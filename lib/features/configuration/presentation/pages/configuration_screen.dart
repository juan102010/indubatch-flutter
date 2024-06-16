import 'package:flutter/material.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});
  static const routeName = "/configuration";
  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('configuracion'),
    );
  }
}
