import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:azapay/app/app.dart';
import 'package:azapay/src/ui/ui.dart';

class QRCodeUI extends StatefulWidget {
  final QrScan qrScan;
  //0 for dashboard
  //1 for profile

  const QRCodeUI({Key key, this.qrScan}) : super(key: key);

  @override
  _QRCodeUIState createState() => _QRCodeUIState();
}

class _QRCodeUIState extends State<QRCodeUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        //widget.qrScan.whichscreen == 0?
        Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: DashBoardBackgroundUI(
        title: AppStrings.qrCodeone,
        subtitle: AppStrings.qrCodetwo,
        qrscan: true,
        child: ScanQrCodeUI(
          screen: widget.qrScan.whichscreen ?? 0,
        ),
      ),
    );
    // : Scaffold(
    //     resizeToAvoidBottomInset: true,
    //     appBar: AppBar(elevation: 0.0, actions: [
    //       IconButton(
    //         icon: Icon(Icons.share),
    //         onPressed: () {},
    //       )
    //     ]),
    //     body: DashBoardBackgroundUI(
    //       title: AppStrings.qrCodeone,
    //       qrscan: true,
    //       subtitle: AppStrings.qrCodetwo,
    //       child: ScanQrCodeUI(),
    //     ),
    //   );
  }
}
