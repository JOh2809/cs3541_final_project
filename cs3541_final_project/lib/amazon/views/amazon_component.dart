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
  _AmazonSearchPageState createState() => _AmazonSearchPageState();
}

class _AmazonSearchPageState extends State<AmazonSearchPage> {
  //final AmazonSearchPresenter presenter;
  AmazonSearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = _amazonBooksData;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List<List<dynamic>> _amazonBooksData = [];
  List<List> filteredNames = []; // names filtered by search text


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

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List<List> tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i][4].contains(_searchText)) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: _amazonBooksData == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index][4]),
          onTap: () => print(filteredNames[index][4]),
        );
      },
    );
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                );
              },
              suggestionsBuilder: (BuildContext context,
                  SearchController controller) {
                return List<ListTile>.generate(_amazonBooksData.length, (int index) {
                  String title =_amazonBooksData[index][0].toString();
                  String author =_amazonBooksData[index][2].toString();
                  String isbn =_amazonBooksData[index][4].toString();
                  final String isbn13 = '$title, $author, $isbn';
                  return ListTile(
                    title: Text(isbn13),
                    onTap: () {
                      setState(() {
                        controller.closeView(isbn13);
                      });
                    },
                  );
                });
              },
            ),
          ],
        )
      ),
    );
  }
}

class AmazonBookListPage extends StatefulWidget {
  final AmazonBookListPresenter presenter;

  AmazonBookListPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AmazonBookListPageState createState() => _AmazonBookListPageState();
}

class _AmazonBookListPageState extends State<AmazonBookListPage> {
  List<List<dynamic>> _amazonBooksData = [];
  List<List> filteredNames = []; // names filtered by search text


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
        title: Text('Amazon Books List'),
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
              leading: Column(
                  children: <Widget> [
                    Text(_amazonBooksData[index][0].toString()),
                    InkWell(
                        child: Text('Save Book'),
                        onTap: () {}
                    ),
                  ]
              ),
              trailing: Text(_amazonBooksData[index][2].toString()),
              title: Text(_amazonBooksData[index][1]),
              subtitle: Text(_amazonBooksData[index][4].toString()),
                    //May add isbn10 (index 3) here or within future card hero.
              isThreeLine: true,
            ),
          );
          },
      )
    );
  }
}
