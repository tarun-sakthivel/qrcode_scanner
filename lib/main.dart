import 'package:flutter/material.dart';
import 'package:qrcode_scanner/qr_codescanner.dart';

void main() {
  runApp(const qrcode_scanner());
}

class qrcode_scanner extends StatelessWidget {
  const qrcode_scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR code scanner",
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent)),
      home: const QrScanner(),
      debugShowCheckedModeBanner: false,
    );
  }
}
