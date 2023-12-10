import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presenter/savedlist_presenter.dart';
import '';

class SavedListPage extends StatefulWidget {
  final SavedListPresenter presenter;

  SavedListPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _BookListPageState createState() => _BookListPageState();
}
class _BookListPageState extends State<SavedListPage> {

  void initState(){
    super.initState();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Books'),
      ),

      body: Container(
        child: Center(
          child: Text('In Development', style: TextStyle(fontSize: 24),), //Text
        ),
      )
    );
  }
}