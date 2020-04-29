import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isClicked = false;
  AnimationController _controller;
  Animation<double> _open_drawer;
  Animation<double> _open_icon;
  int vab = 0;
  _changeState() {
    if (isClicked) {
      isClicked = false;
      _controller.reverse();
    } else {
      _controller.forward();
      isClicked = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _open_drawer = new Tween<double>(begin: 0.0, end: 100).animate(_controller);
    _open_icon = new Tween<double>(begin: 100, end: 10).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext buildercontext, Widget child) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: Color(0xFFEFF3F5),
                  body: Stack(children: <Widget>[
                    drawer(),
                    Transform(
                        transform: Matrix4.translationValues(
                            _open_drawer.value, 0.0, 0.0),
                        child: home()),
                  ])));
        });
  }

  Widget drawer() {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Icon(
                    Icons.perm_identity,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: _open_icon.value,
              ),
              InkWell(
                  onTap: () {
                    //favourite
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: InkWell(
                          onTap: () {
                            /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Favourite()));*/
                          },
                          child: Image.asset(
                            'assets/images/twitter_PNG3.png',
                            height: 100,
                            width: 300,
                            fit: BoxFit.scaleDown,
                          )
                      ))),
              SizedBox(
                height: _open_icon.value,
              ),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        )
                      ],
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Image.asset(
                    'assets/images/Linkedin-Icon.png',
                    height: 100,
                    width: 200,
                    fit: BoxFit.scaleDown,
                  )),
              SizedBox(
                height: _open_icon.value,
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue[500],
                        blurRadius: 5.0,
                      ),
                    ],
//                      border: Border.all(color: Colors.black, width: 1)
                  ),
                  child: Center(
                      child: Icon(
                    Icons.mail,
                    color: Colors.blue[500],
                  )))
            ]));
  }

  Widget home() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Scaffold(
          backgroundColor: Colors.blue[500],
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.blue[500],
              leading: InkWell(
                onTap: () {
                  _changeState();
                },
                child: Icon(
                  isClicked ? Icons.close : Icons.menu,
                  color: Colors.black54,
                ),
              ),
              title: Text(
                "Developer Contact",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              )),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/IMG_1844.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Akil S',
                style: TextStyle(
//                    fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'FLUTTER DEVELOPER | GRAPHIC DESIGNER',
                style: TextStyle(
//                    fontFamily: 'SourceSansPro',
                  color: Colors.teal.shade100,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blue[500],
                  ),
                  title: Text(
                    '+91 7904748133',
                    style: TextStyle(
                      color: Colors.teal.shade900,
//                        fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue[500],
                  ),
                  title: Text(
                    'akillika49@gmail.com',
                    style: TextStyle(
                      color: Colors.teal.shade900,
//                        fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
