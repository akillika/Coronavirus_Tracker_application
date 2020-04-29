import 'package:demo/datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
//            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            color: Colors.blue[500],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Developed with ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
              Icon(Icons.favorite,color: Colors.pinkAccent,size: 20,),
                Text(' by Akil S    ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
