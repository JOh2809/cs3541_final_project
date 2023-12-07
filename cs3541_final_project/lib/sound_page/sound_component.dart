import 'package:cs3541_final_project/sound_page/sound_player.dart';
import 'package:cs3541_final_project/sound_page/sound_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SleepMusicPage extends StatefulWidget {
  final SleepMusicPresenter presenter;

  SleepMusicPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SleepMusicPageState createState() => _SleepMusicPageState(presenter);
}

class _SleepMusicPageState extends State<SleepMusicPage> {
  final SleepMusicPresenter presenter;
  _SleepMusicPageState(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Music'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("(ULTRA CALM) Sleep Music                                                              ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            YoutubeVideo("https://www.youtube.com/watch?v=SaRjRbkW6K4"),
            SizedBox(height: 10,),
            Text("Relaxing Water Sounds for Sleep                                                      ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            YoutubeVideo("https://www.youtube.com/watch?v=A1IYf7fKdhY"),
            SizedBox(height: 10,),
            Text("Deep White Noise for Falling Asleep                                                ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            YoutubeVideo("https://www.youtube.com/watch?v=FdN1pnEaJs0")
          ],),
      ),
    );
  }
}