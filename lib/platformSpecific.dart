import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:four_features/constants.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformSpecific extends StatefulWidget {


  PlatformSpecific({Key key}) : super(key: key);

  @override
  _PlatformSpecificState createState() => _PlatformSpecificState();
}

class _PlatformSpecificState extends State<PlatformSpecific> {

    

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    MainIcons platformIcon;
    if (platform == TargetPlatform.iOS) {
      platformIcon = IosIcons();
    } else{
      platformIcon = AndroidIcons();
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(platformIcon.back),
        title: Text("Platform Specific Widget")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Center(child: Text( "Changes depending on platform", style: TextStyle(fontSize: 20, color: Colors.blue),)),
            SizedBox(height: 10),
            showcaseIcon(platformIcon.back, "Back Icon"),
            SizedBox(height: 10),
            showcaseIcon(platformIcon.reply, "Reply Icon"),
            SizedBox(height: 10),
            showcaseIcon(platformIcon.share, "Share Icon"),
            SizedBox(height: 10),
            showcaseIcon(platformIcon.book, "Book Icon"),
            SizedBox(height: 10),
            Center(child: Text( "Platform Specific Widgets Package", style: TextStyle(fontSize: 20, color: Colors.blue),)),
            SizedBox(height: 10),
            Center(child: PlatformText('Cancel')),
            SizedBox(height: 10),
            PlatformTextField(),
            SizedBox(height: 10),
            PlatformButton(
              onPressed: () => print('send'),
              child: PlatformText('Send'),
            ),
            SizedBox(height: 10),
            Icon(PlatformIcons(context).book)
          ]
        ),
      ),
    );
  }

  Widget showcaseIcon(IconData icon, String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      Icon(icon), Text(text)
    ],);
  }

}