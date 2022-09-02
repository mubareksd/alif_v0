import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:alif/model/lessons.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

class Melmeja extends StatefulWidget {
  int position;
  Melmeja(this.position);

  @override
  State createState() {
    return MelmejaState();
  }
}

class MelmejaState extends State<Melmeja> {
  Lessons lessons;
  var title;
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    readData(this.widget.position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: lessons == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 3,
              children: lessons.lesson
                  .map((les) => Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () => audioCache.play(les.sound),
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
                                          fontSize: 30.0,
                                          fontFamily: "amiri-regular",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        les.spellAm,
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontFamily: "NotoSansEthiopic-SemiCondensedBold",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        les.spellEn,
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  )
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

  readData(int which) async {
    String file;
    switch (which) {
      case 1:
        file = "lesson_$which";
        title = "መልመጃ 1";
        break;
      case 2:
        file = "lesson_$which";
        title = "መልመጃ 2";
        break;
      case 3:
        file = "lesson_$which";
        title = "መልመጃ 3";
        break;
      case 4:
        file = "lesson_$which";
        title = "መልመጃ 4";
        break;
      case 5:
        file = "lesson_$which";
        title = "መልመጃ 5";
        break;
      case 6:
        file = "lesson_$which";
        title = "መልመጃ 6";
        break;
      case 7:
        file = "lesson_$which";
        title = "መልመጃ 7";
        break;
      //case 8:
        //file = "lesson_$which";
        //title = "መልመጃ 8";
        //break;
      //case 9:
        //file = "lesson_$which";
        //title = "መልመጃ 9";
        //break;
      //case 10:
        //file = "lesson_$which";
        //title = "መልመጃ 10";
        //break;
    }
    String jsonString = await rootBundle.loadString('assets/data/$file.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    lessons = Lessons.fromJson(jsonMap);
    setState(() {});
  }
}
