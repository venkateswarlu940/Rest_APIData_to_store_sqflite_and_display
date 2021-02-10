import 'dart:async';

import 'package:api_storage/screen/home.dart';
import'package:flutter/material.dart';
class splash_data extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return home();
  }
}
class home extends State<splash_data> {
  void initState() {
    super.initState();
    Timer(
     Duration(seconds: 5),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => User_Api1()
                )
            )
    );
  }
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
         body: Container(
           color: Colors.white,
           child: Image.network("https://cdn.dribbble.com/users/421466/screenshots/2379575/replace-2r-400px.gif",height: 800,width: 500,),
        //     // child:Image.asset("assets/images/splash.gif",
        //
        //     ),
        //     child:FlutterLogo(size: MediaQuery
        //         .of(context)
        //         .size
        //         .height)
        ),
      );
    }
  }
//http://4.bp.blogspot.com/-jwRb7oAVylM/Uz6gFGRLjwI/AAAAAAAAAv8/N7vFVfM_b4o/s1600/splash-screen.png