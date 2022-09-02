import 'package:alif/model/melmejas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'melmeja.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ኣሊፍ",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Size size;
  Melmejass melmejass;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    String jsonString = await rootBundle.loadString('assets/data/melmeja.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    melmejass = Melmejass.fromJson(jsonMap);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //size = MediaQuery.of(context).size;
    return Scaffold(
      body: melmejass == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: melmejass.melmejas
                  .map((les) => Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            load(context, les.id);
                          },
                          child: Hero(
                            tag: les.id,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        les.name,
                                        style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 20.0,
                                          fontFamily: "NotoSansEthiopic-CondensedMedium",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }

  load(BuildContext ctx, position) {
    Navigator.push(ctx, MaterialPageRoute(builder: (_) {
      return Melmeja(position);
    }));
  }
}
