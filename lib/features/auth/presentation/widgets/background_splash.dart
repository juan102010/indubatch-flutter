import 'package:flutter/material.dart';
import 'package:indubatch_movil/core/routes/resource_icons.dart';

class BackgroundSplash extends StatefulWidget {
  const BackgroundSplash({super.key});

  @override
  State<BackgroundSplash> createState() => _BackgroundSplashState();
}

class _BackgroundSplashState extends State<BackgroundSplash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(fondoIndubatch),
        fit: BoxFit.cover,
      )),
    );
  }
}