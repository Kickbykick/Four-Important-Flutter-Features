import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:four_features/constants.dart';
import 'package:four_features/dynmTheme.dart';
import 'package:four_features/onboarding.dart';
import 'package:four_features/platformSpecific.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ThemeData currThemeData;
  bool bNewUser;

  Future<void> getDefault() async {
    String dynTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    dynTheme = prefs.getString("dynamicTheme") ?? 'Light Mode';
    bNewUser = prefs.getBool("newUser") ?? true;

    if(dynTheme == "Light Mode")
      currThemeData = Constants.lightModeTheme;
    else
      currThemeData = Constants.darkModeTheme;
  }

  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder(
      future: getDefault(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(currThemeData == null) return Center(child: Container(child: CircularProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Colors.black),)));

        return DynamicTheme(
          defaultBrightness: currThemeData.brightness,
          data: (Brightness brightness){ getDefault(); return currThemeData; },
          themedWidgetBuilder: (context, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              home: OnboardingScreen(), // bNewUser ? OnboardingScreen() : PlatformSpecific(),
            );
          }
          
        );
      },
    );
    
   }
}