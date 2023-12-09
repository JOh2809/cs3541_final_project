import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presenter/amazon_presenter.dart';

/*
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../views/dreams_view.dart';
import '../presenter/dreams_presenter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'VideoPlayer.dart';
import 'package:intl/intl.dart';
 */

class AmazonSearchPage extends StatefulWidget {
  final AmazonSearchPresenter presenter;

  AmazonSearchPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AmazonSearchPageState createState() => _AmazonSearchPageState(presenter);
}

class _AmazonSearchPageState extends State<AmazonSearchPage> {
  final AmazonSearchPresenter presenter;
  _AmazonSearchPageState(this.presenter);
  List<List<dynamic>> _amazonBooksData = [];

  @override
  void initState() {
    super.initState();
    _openCSV();
  }

  void _openCSV() async {
    final rawData = await rootBundle.loadString("assets/Amazon_Books_Data.csv");
    List<List<dynamic>> bookData = const CsvToListConverter().convert(rawData);
    setState(() {
      _amazonBooksData = bookData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Amazon Books Search Engine'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView.builder(
              itemCount: _amazonBooksData.length,
               itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(6),
                  color: Colors.white,
                    child: ListTile(
                     leading: Text(_amazonBooksData[index][0].toString()),
                     title: Text(_amazonBooksData[index][1]),
                     trailing: Text(_amazonBooksData[index][2].toString()),
                    ),
                );
                },
            ),
          //],
        );
      //);
    //);
  }
}




