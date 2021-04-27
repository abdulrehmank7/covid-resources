import 'dart:io';

import 'package:covid_resources/utils/common_utils.dart';
import 'package:covid_resources/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
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
              initialUrl: SUPPORT_URL,
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
