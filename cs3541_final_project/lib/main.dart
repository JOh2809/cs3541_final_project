import 'package:cs3541_final_project/comparison/presenter/comparison_presenter.dart';
import 'package:cs3541_final_project/comparison/views/comparison_components.dart';
import 'package:flutter/material.dart';
import 'amazon/views/amazon_component.dart';
import '../amazon/presenter/amazon_presenter.dart';
import 'alarm/presenter/alarm_presenter.dart';
import 'alarm/views/alarm_component.dart';

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
      home: const MyHomePage(title: 'Final Project'),
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
              child: const Text('Alarm Page', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AlarmScreen();
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
              child: Text('Book List Comparison', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ComparisonScreen();
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
class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreen();
}

class _AlarmScreen extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return AlarmPage(
      AlarmPresenter(), title: "Alarm Page", key: const Key("ALARM"),);
  }
}

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});
  @override
  State<ComparisonScreen> createState() => _ComparisonScreen();
}

class _ComparisonScreen extends State<ComparisonScreen>{
  @override
  Widget build(BuildContext context) {
    return ComparisonPage(
        ComparisonPresenter(), title: "Alarm Page", key: const Key("COMPARISON"),);
  }
}