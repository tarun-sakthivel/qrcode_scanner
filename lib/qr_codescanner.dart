import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannercode = '';

  @override
  void dispose() {
    controller?.dispose(); //stops the camera and diposes the barcode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 280,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 60,
              ),
              SizedBox(
                  height: 270,
                  width: 250,
                  child:
                      QRView(key: qrkey, onQRViewCreated: _onQRViewController)),
            ]),
            Text(
              'Scanned Code: $scannercode',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewController(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (event) {
        setState(() {
          scannercode = event.code!;
        });
      }, //what you want to do code here
    );
  }
}
