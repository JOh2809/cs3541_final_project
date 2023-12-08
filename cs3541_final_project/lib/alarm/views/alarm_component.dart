import 'package:flutter/material.dart';
import '../presenter/alarm_presenter.dart';

class AlarmPage extends StatefulWidget {
  final AlarmPresenter presenter;
  final String title;
  const AlarmPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  @override
  void initState() {
    super.initState();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}