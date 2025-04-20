import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class CallPage extends StatefulWidget {
  final String channelName;
  final String clientRole;
  const CallPage(
      {Key? key, required this.channelName, required this.clientRole})
      : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
