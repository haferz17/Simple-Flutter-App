import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key?key}): super(key: key);
  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width*0.6;
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:Image.network('https://dbaeumer.gallerycdn.vsassets.io/extensions/dbaeumer/vscode-eslint/2.2.3/1642067257652/Microsoft.VisualStudio.Services.Icons.Default',width:width)), 
          const Padding(padding: EdgeInsets.only(top: 10), child:Text('Travel',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w500)),) 
        ]
      ),
      backgroundColor: Colors.blue
    );
  }
}