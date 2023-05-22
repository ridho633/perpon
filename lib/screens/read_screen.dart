import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';


class ReadScreen extends StatefulWidget {
  @override
  _ReadScreen createState() => _ReadScreen();
}

class _ReadScreen  extends State<ReadScreen> {
  late String localPath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PDF().fromUrl('https://www.africau.edu/images/default/sample.pdf')
      )
    );

  }
}


