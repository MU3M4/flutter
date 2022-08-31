import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class MechanicProfile extends StatefulWidget {
  const MechanicProfile({Key? key}) : super(key: key);

  @override
  State<MechanicProfile> createState() => _MechanicProfileState();
}

class _MechanicProfileState extends State<MechanicProfile> {
  static final String oneSignalAppId = '048cb7d8-66ee-4423-999a-d96a5269148a';
  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;
  TextEditingController username = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool isFlutterLocalNotificationsInitialized = false;
  String? mtoken = "";
  @override
  void initState() {
    loadFCM();
    listenFCM();
    getToken();
    requestPermission();
    initPlatformState();
    FirebaseMessaging.instance.subscribeToTopic('Car Service');
    super.initState();
  }
  void getTokenFromFirestore() async{

  }
 void saveToken(String token) async{
    await FirebaseFirestore.instance.collection('UserTokens').doc('User1').set(
        {
          'token': token,
        });
 }
  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAA-q2TecI:APA91bFtOcsvrfu_Ba89oArxQ5-PtYO-R2i3fWLjWzWJ8sLLF6jAlfDWSw4fpiQ_Tqp0BNbypluDONrB-6hQN7MIEEFivpPPUScHmNcn5mYlCKszcX9o0Vd5Ri5W50i8o3e80-hRn8LZ',
          },
          body: jsonEncode(<String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': token,
          }));
    } catch (e) {}
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {

    setState(() {
      mtoken =token;
    });
    saveToken(token!);
    });
  }
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined permissions');
    }
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
Future<void> initPlatformState() async{
    OneSignal.shared.setAppId(oneSignalAppId);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanic Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: username,
                decoration: const InputDecoration(
                  hintText: 'Input your username',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Title of the message',
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: body,
                decoration: const InputDecoration(
                  hintText: 'The body of your text',
                ),
              ),
            ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () async{
              String name = username.text.trim();
              String titleText = title.text;
              String bodyText = body.text;
              if (name != ""){
                DocumentSnapshot snap = await FirebaseFirestore.instance.collection('UserTokens').doc(name).get();
                String token = snap['token'];
                print(token);
                sendPushMessage(token, titleText, bodyText);
              }
            },
            child: Container(
              height: 40,
                width: 200,

            ),
          ),
            ]
        ),
      ),
    );
  }
}
