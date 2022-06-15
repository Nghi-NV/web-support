import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebSupport extends StatefulWidget {
  const WebSupport({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<WebSupport> createState() => _WebSupportState();
}

class _WebSupportState extends State<WebSupport> {
  late WebViewXController webviewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return WebViewX(
          initialContent: '<h2> Hello, world! </h2>',
          onWebViewCreated: (controller) {
            webviewController = controller;

            webviewController.loadContent(
              widget.url,
              SourceType.url,
            );
          },
          height: constraints.maxHeight,
          width: constraints.maxWidth,
        );
      },
    );
  }
}
