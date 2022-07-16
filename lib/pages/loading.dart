import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async
  {
    WorldTime vinay=WorldTime('Asia/Karachi','Karachi','pakistan.png');
    await vinay.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:
    {
      'time':vinay.time,'location':vinay.location,'flag':vinay.flag,'isDay':vinay.isDay});
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
