import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:demo/datasource.dart';
import 'package:dynamic_theme/dynamic_theme.dart';



//-------------------------------------------------------

class FirebaseMessagingDemo extends StatefulWidget {

  FirebaseMessagingDemo(): super();

  final String title = 'Firebase Messaging Demo';

  @override
  _FirebaseMessagingDemoState createState() => _FirebaseMessagingDemoState();
}

class _FirebaseMessagingDemoState extends State<FirebaseMessagingDemo> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<Message> _messages;


  _getToken(){
    _firebaseMessaging.getToken().then((deviceToken){
      print("Device token : $deviceToken");
    });
  }

  _configureFirebaseListeners(){
    _firebaseMessaging.configure(
      onMessage: (Map<String , dynamic>message)async{
        print("onMessage: $message");
        _setMessage(message);
      },
      onLaunch: (Map<String , dynamic>message)async{
        print("onMessage: $message");
        _setMessage(message);
      },
      onResume: (Map<String , dynamic>message)async{
        print("onMessage: $message");
        _setMessage(message);
      },

    );
  }

  _setMessage(Map<String , dynamic>message){
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    setState(() {
      Message m =Message(title, body, message);
      _messages.add(m);
    });






  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messages=List<Message>();
    _configureFirebaseListeners();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Message{
  String title;
  String body;
  String message;
  Message(title,body,message){
    this.title=title;
    this.body=body;
    this.message=message;
  }
}
