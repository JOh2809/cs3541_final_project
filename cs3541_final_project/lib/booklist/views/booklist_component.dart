import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presenter/booklist_presenter.dart';

class BookListPage extends StatefulWidget {
  final BookListPresenter presenter;

  BookListPage(this.presenter, {required Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _BookListPageState createState() => _BookListPageState();
}
class _BookListPageState extends State<BookListPage> {

  void initState(){
    super.initState();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookList Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}