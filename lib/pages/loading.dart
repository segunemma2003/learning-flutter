import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtimeapp/main.dart';
import 'dart:convert';
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:worldtimeapp/services/world_time.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance=WorldTime(location:"Nigeria",flag:'',url:"Africa/Lagos");
    await instance.getTime();
    String home;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }
  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitFadingCube(
          color:Colors.white,
          size:80.0,
        )
      )
    );
  }
}
