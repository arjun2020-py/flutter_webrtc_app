import 'dart:math';

import 'package:flutter/material.dart';

import 'screen/join_screen.dart';
import 'services/singaling_service.dart';

void main() {
  // start videoCall app
  runApp(VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  VideoCallApp({super.key});

  //steps:
  //1): define  signalling server url and  genrate callerId of local user

  // signalling server url
  final String websocketUrl = "WEB_SOCKET_SERVER_URL";

  // generate callerID of local user
  final String selfCallerID = Random().nextInt(1000).toString().padLeft(6, '0');

  @override
  Widget build(BuildContext context) {
    
    //2: intilazie signalling service  with webSocketUrl and selfCallerId

    // init signalling service
    SignallingService.instance.init(
      websocketUrl: websocketUrl,
      selfCallerID: selfCallerID,
    );

    // return material app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(),
      ),
      themeMode: ThemeMode.dark,
      home: JoinScreen(selfCallerId: selfCallerID),
    );
  }
}
