import 'package:flutter/material.dart';
import '../presenter/alarm_presenter.dart';
import 'dart:async';
import 'dart:core';



class AlarmPage extends StatefulWidget {
  final AlarmPresenter presenter;
  const AlarmPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Page'),
        backgroundColor: Colors.deepPurpleAccent.shade200,
        ),

    );
  }
}