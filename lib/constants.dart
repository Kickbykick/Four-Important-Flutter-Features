import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{


  static ThemeData lightModeTheme = ThemeData(
brightness: Brightness.light,
backgroundColor: Colors.white70,
primaryColor: Colors.white,
// primarySwatch: Colors.black,
iconTheme: IconThemeData(color: Colors.black),
cardColor: Colors.white,
canvasColor: Colors.white,
bottomAppBarColor: Colors.white,

);

  static ThemeData darkModeTheme = ThemeData(
brightness: Brightness.dark,
backgroundColor: Colors.black,
primaryColor: Colors.black,
// primarySwatch: Colors.black54,
iconTheme: IconThemeData(color: Colors.white),
cardColor: Colors.grey[900],
canvasColor: Colors.black

);
}

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 16.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
  height: 1.2,
);

class MainIcons{
  IconData back = CupertinoIcons.back;
  IconData reply = CupertinoIcons.reply;
  IconData share = CupertinoIcons.share;
  IconData book = CupertinoIcons.book;
  }

  class IosIcons extends MainIcons{
    IconData back = CupertinoIcons.back;
    IconData reply = CupertinoIcons.reply;
    IconData share = CupertinoIcons.share;
    IconData book = CupertinoIcons.book;
  }

  class AndroidIcons extends MainIcons{
  IconData back = Icons.arrow_back;
  IconData reply = Icons.reply;
  IconData share = Icons.share;
  IconData book = Icons.book;
  }
  
