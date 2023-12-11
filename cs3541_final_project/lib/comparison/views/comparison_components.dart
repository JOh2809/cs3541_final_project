import 'package:cs3541_final_project/comparison/presenter/comparison_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComparisonPage extends StatefulWidget {
  final ComparisonPresenter presenter;
  const ComparisonPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparison Page'),
        backgroundColor: Colors.white,
      ),
    );
  }
}