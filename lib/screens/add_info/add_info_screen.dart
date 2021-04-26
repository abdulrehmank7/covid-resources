import 'dart:io';

import 'package:covid_resources/utils/common_utits.dart';
import 'package:covid_resources/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AddInfoScreen extends StatefulWidget {
  static const id = "add_info_screen";

  @override
  _AddInfoScreenState createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen> {
  bool isWebViewLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNav(context),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: ADD_DATA_URL,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (value) {
                setState(() {
                  isWebViewLoading = false;
                });
              },
            ),
            if (isWebViewLoading) Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
