import 'dart:convert';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:demo/Widgets/infopane;.dart';
import 'package:demo/Widgets/mostaffectedcountries.dart';
import 'package:demo/Widgets/worldwidepane;.dart';
import 'package:demo/datasource.dart';
import 'package:demo/pages/countrypage.dart';
import 'package:demo/pages/developerpage.dart';
import 'package:demo/pages/faqs.dart';
import 'package:demo/webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldwideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldwideData();
    fetchCountryData();
    super.initState();
  }

  Future fetchData() async{
    fetchWorldwideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],
        backgroundColor: Colors.blue[500],
        centerTitle: false,
        title: Text('Corona Virus Tracker',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Worldwide',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CountryPage()));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue[500],
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'Countries',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                worldData == null
                    ? Center(child: CircularProgressIndicator())
                    : WorldwidePanel(
                  worldData: worldData,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Highly Affected Countries',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                countryData == null
                    ? Container()
                    : MostAffectedPanel(
                  countryData: countryData,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                      'LET\'S FIGHT THIS PANDEMIC TOGETHER',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                SizedBox(
                  height: 10,
                ),
                InfoPanel(),
              ],
            )),
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Center(
                    child: Text(
                      'Corona Virus Tracker ',
                      style: TextStyle(fontSize: 27, color: Colors.white,fontWeight: FontWeight.bold),
                    )),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[500],
                  image: DecorationImage(
                      image: AssetImage('assets/images/Coronavirus-slider.jpg'),
                      fit: BoxFit.cover)),
            ),
            ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'FAQS',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FAQPage()));
                }),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                      title: "Myth Busters",
                      selectedUrl:
                      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters",
                    )));
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Myth Busters',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>   MyWebView(
                      title: "Donate to WHO ",
                      selectedUrl: "https://covid19responsefund.org/",
                    )));
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Donate to WHO',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 240.0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Developer Contact',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
