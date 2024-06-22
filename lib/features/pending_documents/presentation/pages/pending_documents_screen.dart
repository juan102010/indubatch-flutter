import 'package:flutter/material.dart';

class PendingDocumentsScreen extends StatefulWidget {
  const PendingDocumentsScreen({super.key});
  static const routeName = "/";
  @override
  State<PendingDocumentsScreen> createState() => _PendingDocumentsScreenState();
}

class _PendingDocumentsScreenState extends State<PendingDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('documentos pendientes'),
    );
  }
}
