import 'package:flutter/material.dart';
import 'amazon/views/amazon_component.dart';
import '../amazon/presenter/amazon_presenter.dart';
import '../savedlist/presenter/savedlist_presenter.dart';
import '../savedlist/views/savedlist_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.withOpacity(.5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
              ),
              child: Text('Amazon Search', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AmazonSearchScreen();
                  },
                ));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.withOpacity(.5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
              ),
              child: Text('Amazon Book List', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AmazonBookListScreen();
                  },
                ));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.withOpacity(.5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))
              ),
              child: Text('Saved Books', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SavedListScreen();
                  },
                ));
              },
            ),
          ],
        ),
      );
    //);
  }
}


class AmazonSearchScreen extends StatefulWidget {
  @override _AmazonSearchScreen createState() => _AmazonSearchScreen();
}

class _AmazonSearchScreen extends State<AmazonSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return new AmazonSearchPage(
      new AmazonSearchPresenter(), title: 'Amazon Search', key: Key("SEARCH"),);
  }
}

class AmazonBookListScreen extends StatefulWidget {
  @override _AmazonBookListScreen createState() => _AmazonBookListScreen();
}

class _AmazonBookListScreen extends State<AmazonBookListScreen> {
  @override
  Widget build(BuildContext context) {
    return new AmazonBookListPage(
      new AmazonBookListPresenter(), title: 'Amazon Book List', key: Key("BOOK LIST"),);
  }
}

class SavedListScreen extends StatefulWidget {
 @override _SavedListScreen createState() => _SavedListScreen();
}

class _SavedListScreen extends State<SavedListScreen> {
  @override
  Widget build(BuildContext context) {
    return new SavedListPage(
      new SavedListPresenter(), title: 'Saved Books', key:Key("SAVED BOOKS"),
    );
  }
}