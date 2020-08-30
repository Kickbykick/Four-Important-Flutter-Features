import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:four_features/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class DynmTheme extends StatefulWidget {
  DynmTheme({Key key}) : super(key: key);

  @override
  _DynmThemeState createState() => _DynmThemeState();
}

class _DynmThemeState extends State<DynmTheme> {

  setSharedPrefs(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dynamicTheme', themeName);
    if(themeName == "Light Mode")
      DynamicTheme.of(context).setThemeData(Constants.lightModeTheme);
    else
      DynamicTheme.of(context).setThemeData(Constants.darkModeTheme);
  }

  @override
  Widget build(BuildContext context) {
    bool bLightMode =  DynamicTheme.of(context).data == Constants.lightModeTheme ? true:false;

    return Scaffold(
      appBar: AppBar(
         title: Text("Dynamic Theme"),
      ),
      body: ListTile(
          title: InkWell(
            onTap: () => setState(() { bLightMode = !bLightMode; }),
            child: Switch.adaptive(
              activeColor: Colors.blue,
              value: bLightMode, 
              onChanged:(val) { 
                if( val )
                { setSharedPrefs("Light Mode"); }
                else
                { setSharedPrefs("Dark Mode"); }

                setState(() {
                  bLightMode = val;
                });
                
              }
            ),
          ),
          leading: Text("Light Mode", style: TextStyle(fontSize: 16)),
        ),
    );
  }
}