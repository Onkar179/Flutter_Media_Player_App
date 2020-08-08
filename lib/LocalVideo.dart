import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController videoPlayerController;
Future<void> initializePlayer;

class LocalVideo extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  build(BuildContext b) {
    return Container(
        margin: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(children: <Widget>[
          Center(
              child: Card(
                  child: FutureBuilder(
                      future: initializePlayer,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                                child: VideoPlayer(videoPlayerController)),
                          );
                        } else {
                          return AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Card(
                              child: Container(
                                color: Colors.black87,
                              ),
                              shape: Border.all(color: Colors.pink, width: 10),
                            ),
                          );
                        }
                      }))),
          Container(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 100),
                  child: Card(
                    child: RaisedButton(
                      child: Card(
                        child: Text(
                          'Play',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {});
                        videoPlayerController =
                            VideoPlayerController.asset('assets/videos/lw.mp4');
                        initializePlayer = videoPlayerController.initialize();
                        videoPlayerController.setVolume(1.0);
                        videoPlayerController.play();
                      },
                    ),
                  )),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 100),
                child: RaisedButton(
                  child: Card(
                    child: Text('Pause',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic)),
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    videoPlayerController.pause();
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
          )
        ]));
  }
}
