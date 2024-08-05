import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FlutterLocalNotificationsPlugin 초기화
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  // Firebase 초기화
  await Firebase.initializeApp();
  // 백그라운드에서 메시지 처리 코드
  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
    // 백그라운드에서 알림이 포함된 메시지를 받았을 때 추가적인 처리 가능
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fcmToken = 'Fetching token...';
  String _messageStatus = '';

  @override
  void initState() {
    super.initState();
    _getToken();

    // 앱이 foreground에 있을 때 FCM 메시지 처리
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        setState(() {
          _messageStatus =
              'Message received: ${message.notification!.title} - ${message.notification!.body}';
        });
        _showNotification(message.notification!);
      }
    });

    // 앱이 종료된 상태에서 푸시 알림을 통해 앱을 실행시킬 경우
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        setState(() {
          _messageStatus =
              'Message received from opened app: ${message.notification!.title} - ${message.notification!.body}';
        });
      }
    });
  }

  Future<void> _getToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        setState(() {
          _fcmToken = token;
        });
      }
    } catch (e) {
      setState(() {
        _fcmToken = 'Failed to get token: $e';
      });
    }
  }

  Future<void> _sendPushMessage() async {
    const String serverUrl = 'http://10.0.2.2:3000/send';

    try {
      final response = await http.post(
        Uri.parse(serverUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'token': _fcmToken,
          'message': jsonEncode(<String, String>{
            'title': 'Test Notification',
            'body': 'This is a test message',
          }),
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _messageStatus = 'Message sent successfully';
        });
      } else {
        setState(() {
          _messageStatus = 'Failed to send message';
        });
      }
    } catch (e) {
      setState(() {
        _messageStatus = 'Error sending message: $e';
      });
    }
  }

  Future<void> _showNotification(RemoteNotification notification) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // channel id
      'your_channel_name', // channel name
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      notification.title,
      notification.body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FCM Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('FCM Token:'),
            SelectableText(_fcmToken),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendPushMessage,
              child: const Text('Send Push Message'),
            ),
            const SizedBox(height: 20),
            Text(_messageStatus),
          ],
        ),
      ),
    );
  }
}
