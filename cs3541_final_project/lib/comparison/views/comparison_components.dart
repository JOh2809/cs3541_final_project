import 'package:cs3541_final_project/comparison/presenter/comparison_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class ComparisonPage extends StatefulWidget {
  final ComparisonPresenter presenter;
  const ComparisonPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  List<List<dynamic>> _amazonBooksData = [];


  @override
  void initState() {
    super.initState();
    _openCSV();
  }

  void _openCSV() async {
    final rawData = await rootBundle.loadString("assets/Amazon_Books_Data2.csv");
    List<List<dynamic>> bookData = const CsvToListConverter().convert(rawData);
    setState(() {
      _amazonBooksData = bookData;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparison Page'),
        backgroundColor: Colors.white,
      ),
        body: ListView.builder(
          itemCount: _amazonBooksData.length,
          itemBuilder: (_, index) {
            return Card(
              margin: const EdgeInsets.all(6),
              color: Colors.white,
              child: ListTile(
                leading: Text(_amazonBooksData[index][4].toString()),
                trailing: Text(_amazonBooksData[index][9].toString()),
                title: Text(_amazonBooksData[index][0]),
                subtitle: Text(_amazonBooksData[index][11].toString()),
                //May add isbn10 (index 3) here or within future card hero.
                isThreeLine: true,
              ),
            );
          },
        ));
  }
}