import 'package:app/OnlineAudio.dart';
import 'package:flutter/material.dart';
import 'package:app/LocalAudio.dart';
import 'package:app/LocalVideo.dart';
import 'package:app/OnlineVideo.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Container(
                height: 80,
                child: Scaffold(
                    appBar: AppBar(
                        backgroundColor: Colors.pink,
                        title: Text(
                          'MEDIA_PLAYER',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                        leading: Icon(Icons.play_circle_outline,
                            color: Colors.amber),
                        actions: [
                          Icon(Icons.playlist_play, color: Colors.amber)
                        ],
                        bottom: TabBar(tabs: <Widget>[
                          Tab(
                            text: 'LocalSongs',
                            icon: Icon(Icons.music_note),
                          ),
                          Tab(
                            text: 'OnlineSongs',
                            icon: Icon(Icons.music_note),
                          ),
                          Tab(
                              text: 'LocalVideo',
                              icon: Icon(Icons.video_library)),
                          Tab(
                              text: 'OnlineVideo',
                              icon: Icon(Icons.video_library))
                        ])),
                    body: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                .1,
                                .9
                              ],
                              colors: [
                                Colors.orangeAccent,
                                Colors.lightGreenAccent
                              ]),
                        ),
                        child: TabBarView(children: [
                          LocalAudio(),
                          onlineAudio(),
                          LocalVideo(),
                          OnlineVideo()
                        ]))))),
        debugShowCheckedModeBanner: false);
  }
}
