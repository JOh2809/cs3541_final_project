import 'package:flutter/material.dart';
import '../presenter/alarm_presenter.dart';
import 'dart:async';
import 'dart:core';
import 'package:audioplayers/audioplayers.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'dart:math';

class AlarmPage extends StatefulWidget {
  final AlarmPresenter presenter;
  const AlarmPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  TimeOfDay selectedTime = TimeOfDay.now();
  //final player = AudioCache(fixedPlayer: AudioPlayer());

  final player = AudioCache();
  int checkButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Page'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IconButton(
                    icon: const Icon(
                      Icons.access_alarm_rounded,
                      size: 80,
                    ),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    tooltip: '!',
                    onPressed: () async {
                      _selectTime(context);
                    }),
              ),
            ],
          ),
          const SizedBox(
            width: 32.0,
            height: 32.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  " ${selectedTime.hour}:${selectedTime.minute}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      //await player.play(AssetSource('.../assets/AlarmNoise.mp3'));
                      checkButton = 1;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 5.0,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(360)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 60),
                        textStyle: const TextStyle(
                            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                    child: const Text("Stop"), ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
      checkButton = 0;
    }

    const tenSec = Duration(seconds: 10);
    Timer.periodic(tenSec, (Timer t) => checkTimer(selectedTime));
  }

  checkTimer(TimeOfDay selectedTime) {
    int alarmId = 1;

    final DateTime timeSystem;
    timeSystem = DateTime.now();
    if (timeSystem.hour == selectedTime.hour &&
        timeSystem.minute == selectedTime.minute &&
        checkButton == 0) {
      AndroidAlarmManager.oneShotAt(
          DateTime(selectedTime.hour, selectedTime.minute),
          alarmId,
          //fireAlarm(player));
          fireAlarm(player));
      print('SuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccessSuccess');
      checkButton = 1;
    }
  }
}

fireAlarm(player) {


  player.play('.../assets/AlarmNoise.mp3');
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add(int hour, int minute) {
    Random rnd;
    int min = 1;
    int max = 5;
    rnd = Random();
    minute = minute + min + rnd.nextInt(max - min);
    if (minute >= 60) {
      minute = minute - 60;
      hour = hour + 1;
    }

    return replacing(hour: hour, minute: minute);
  }
}